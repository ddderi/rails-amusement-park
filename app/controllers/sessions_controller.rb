class SessionsController < ApplicationController

  
  
  def new
  end

  def create
    if @user = User.find_by(name: params[:user][:name])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      else
        render 'new'
      end
    

  end
# pour supprimmer le cookies id : session delete user_id
  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
