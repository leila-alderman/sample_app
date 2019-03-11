class SessionsController < ApplicationController
  
  def new
  end

  def create
    # Find the user with that email address
    user = User.find_by(email: params[:session][:email].downcase)
    # If that user exists and is authenticated with the correct password:
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page
    else
      # Create an error message
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end

end
