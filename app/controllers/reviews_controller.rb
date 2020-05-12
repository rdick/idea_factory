class ReviewsController < ApplicationController
    before_action :authenticate_user!

    def create
            review = Review.new(params.require(:review).permit(:body))
            review.idea_id = params[:idea_id]
            review.user_id = current_user.id
            if review.save
                redirect_to idea_path(review.idea)
            else
                flash[:danger] = "Incorrect Parameter in Review"
                redirect_to idea_path(review.idea)
            end
    end

    def destroy
        review = Review.find params[:id]
        if can?(:crud, review)
            review.destroy
            redirect_to idea_path(review.idea)
        else
            flash[:danger] = "Cannot Delete Other Reviews"
            redirect_to idea_path(review.idea)
        end
    end
end
