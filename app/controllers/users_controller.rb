class UsersController < ApplicationController
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
       flash[:success] = "Profile updated"
       redirect_to @user
    else
      render 'edit'
    end
  end
  
  def show
  		@user = User.find(params[:id])
  end
	def new
  		@user = User.new
  end

  def create
  		 @user = User.new(user_params)
  		if @user.save
  			  flash[:success] = "Welcome to the CoinStats App! Now please signin to the application "
  			redirect_to @user
  		# Handle a successful save
  		else
  			render 'new'
  		end
  end

 	private
  def user_params
      	params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
end

