class LikesController < ApplicationController
    def create
        idea = Idea.find params[:idea_id]
        like = Like.new(idea:idea, user: current_user)
        like.save

        redirect_to ideas_path
    end

    def destroy
        idea = Idea.find(params[:id])
        like = idea.likes.find_by(user:current_user) 
        like.destroy
        redirect_to ideas_path
    end
end
