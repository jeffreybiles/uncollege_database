class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_session }
    end
  end

  def create

    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to "/users"
    else
      flash[:notice] = "There were some troubles.  Try again."
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to new_user_session_path
  end

end
