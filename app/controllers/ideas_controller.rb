class IdeasController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]

    def new
        @idea = Idea.new
    end

    def create
        idea = Idea.new(params.require(:idea).permit(:title,:body))
        idea.user = current_user
        if idea.save
            flash[:success] = "New Idea Saved"
            redirect_to :root
        else
            flash[:danger] ="Incorrect Parameters"
            redirect_to new_idea_path
        end
    end

    def show
        @idea = Idea.find params[:id]
        @reviews = @idea.reviews
        @review = Review.new
    end

    def index
        @ideas = Idea.all.order(created_at: :desc)
    end

    def destroy
        idea = Idea.find params[:id]
        if can?(:crud, idea)
            idea.destroy
            redirect_to :root
        else
            flash[:danger] = "Only can delete your own ideas"
            redirect_to idea_path(idea)
        end
    end

    def edit
        @idea = Idea.find params[:id]
        unless can?(:crud, @idea)
            flash[:danger] = "Only can edit your own ideas"
            redirect_to idea_path(@idea)
        end
    end

    def update
        @idea = Idea.find params[:id]
        @idea.update(params.require(:idea).permit(:title,:body))
        if @idea.save
            redirect_to @idea
        else
            redirect_to edit_idea_path
        end
    end

end
