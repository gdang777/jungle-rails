class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/', notice: 'User created'
    else
    render :new
    end
  end

  private
  params.require(:user).permit(
    :first_name,
    :last_name,
    :email,
    :password,
    :password_confirmation
  )

end
