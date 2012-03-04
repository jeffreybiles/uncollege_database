class ActivitiesController < AuthorizedController
  load_and_authorize_resource

  make_resourceful do
    actions :new, :create, :update, :edit, :destroy, :show
  end

  def index
    @search = Activity.search(params[:search])
    @activities = @search.all
  end
end
