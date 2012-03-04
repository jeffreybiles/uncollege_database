class User::SessionsController < Devise::SessionsController
  load_and_authorize_resource

  make_resourceful do
    actions :new, :create
  end

  def destroy
    user_session.destroy
    redirect_to new_user_session_path
  end

end
