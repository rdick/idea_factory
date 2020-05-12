class UsersController < ApplicationController

    def new
        @user = User.new
    end


    def create
        @user = User.new(params.require(:user).permit(:name,:email,:password))
        if @user.save
            flash[:success] = 'User Created'
            redirect_to new_session_path
        else
            flash[:danger] = 'User Parameters Do Not Meet Specifications'
            redirect_to new_user_path
        end
    end

end
