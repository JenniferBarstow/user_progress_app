class SessionsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for signing up!"
      redirect_to root_path
    else
      render:new
    end



  end

  def destroy
    session.destroy
    redirect_to signin_path
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end
