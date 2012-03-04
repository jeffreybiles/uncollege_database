class InterestsController < AuthorizedController
  load_and_authorize_resource
  make_resourceful do
    actions :new, :show, :edit, :create, :index, :update
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy

    redirect_to activities_path
  end
end
