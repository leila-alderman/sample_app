class SessionsController < ApplicationController
  
  def new
  end

  def create
    # Find the user with that email address
    @user = User.find_by(email: params[:session][:email].downcase)
    # If that user exists and is authenticated with the correct password:
    if @user && @user.authenticate(params[:session][:password])
      # If the user has activated his/her account:
      if user.activated?
        # Log the user in and redirect to the user's show page
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or @user
      # else, if the account has not been activated yet
      else
        message = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      # Create an error message
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
