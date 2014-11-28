class ProfileController < ApplicationController

def new
  	@profile = Profile.new
end

def create
  @profile = Profile.new(user_params)
  	if @user.save
      log_in(@user)
  		flash[:success] = "Welcome to the Sample App"
  		redirect_to user_path(@user)
  		# redirect_to(:action => 'show', :id => @user.id)
  	else
  		render 'new'
  	end
  end

end
