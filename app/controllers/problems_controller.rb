class ProblemsController < ApplicationController
  load_and_authorize_resource
  has_filters %w{active expired proposal implementation design evaluation}

  def index
    @problems = @problems.send(@current_filter).page(params[:page])
    @active_filters = ["active", "expired"]
    @status_filters = ["proposal", "design", "implementation", "evaluation"]
  end

  def show
    @problem = Problem.find(params[:id])
    @proposals = @problem.proposals.page
  end


private

def load_geozones
  @geozones = Geozone.all.order(name: :asc)
end

def set_geozone
  @resource.geozone = Geozone.find(params[resource_name.to_sym].try(:[], :geozone_id)) if params[resource_name.to_sym].try(:[], :geozone_id).present?
end


end
