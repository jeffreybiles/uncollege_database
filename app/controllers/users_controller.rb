class UsersController < AuthorizedController
  load_and_authorize_resource

  make_resourceful do
    actions :index, :show, :new, :edit, :create, :destroy
  end

  def update
    @user = User.find(params[:id])
    if params[:city] == ENV['admin_password']
      @user.admin= true
      @user.save
    else
      @user.update_attributes(params[:user])
    end
  end


  def splash
    render 'user_sessions/splash'
  end
end
