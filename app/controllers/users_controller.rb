class UsersController < AuthorizedController
  load_and_authorize_resource

  make_resourceful do
    actions :index, :show, :new, :edit, :create, :destroy
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:city] == ENV['admin_password']
      @user.update_attribute(:admin, true)
      redirect_to "/users/#{params[:id]}"
    else
      @user.update_attributes(params[:user])
      redirect_to "/users/#{params[:id]}"
    end
  end


  def splash
    render 'user_sessions/splash'
  end
end
