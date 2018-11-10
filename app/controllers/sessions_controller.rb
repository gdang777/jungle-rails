class SessionsController < ApplicationController
  def new
    # @user = User.new
  end

  def create
    # if user = User.authenticate_with_credentials(params[:email], params[:password])

    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(params[:password])
      puts @user
    #   # Save the user id inside the browser cookie. This is how we keep the user
    #   # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
      @messages = []
      if user
        @messages << "Incorrect Password" if params[:password].length != 0
      else
        @messages << "User does not exist" if params[:email].length != 0
      end
      @messages << "Email is blank" if params[:email].length == 0
      @messages << "Password is blank" if params[:password].length == 0
      render :new
    end

  end
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
