class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in(@user)
  		flash[:success] = "Welcome to the Sample App"
  		redirect_to user_path(@user)
  		# redirect_to(:action => 'show', :id => @user.id)
  	else
  		render 'new'
  	end
  end


  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :address,
  									:password_confirmation)
  end
end
