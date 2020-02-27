class UsersController < ApplicationController
   before_action :authenticate_user!
   def edit
        @user = User.find(params[:id])
        if !(@user.id == current_user.id)
            redirect_to user_path(current_user)
        end
    end
    def show
    @book = Book.new
    @user = User.find(params[:id])
    flash[:notice] ="Welcome! You have signed up successfully"
    end
    def index
     @book = Book.new
    @users = User.new
    @users = User.all
    @user = current_user

    end
    def update
    	@user = User.find(params[:id])
    	if  @user.update(user_params)
            flash[:notice] ="You have updated user successfully"
          redirect_to user_path(current_user.id)
		else
		  render 'edit'
		end
	end
	private
	def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
	end


end
