class User::SessionsController < Devise::SessionsController
  load_and_authorize_resource

  make_resourceful do
    actions :new, :create
  end

  #this isn't called!
  def destroy
    user_session.destroy
    redirect_to registrations_path
  end

end
