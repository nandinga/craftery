class FeaturesController < InheritedResources::Base
  belongs_to :project
  respond_to :html

  actions :all, except: :index

  protected

  def permitted_params
    params.permit(:feature => [:name, :description, :state, :project_id])
  end

  def create_resource(feature)
    feature.owner = User.first   # TODO: fix when user auth is implemented!!
    super
  end

end
