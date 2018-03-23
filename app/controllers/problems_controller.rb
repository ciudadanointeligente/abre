class ProblemsController < ApplicationController
  load_and_authorize_resource
  has_filters %w{active expired proposal implementation}

  def index
    @problems = @problems.send(@current_filter).page(params[:page])
    @active_filters = ["active", "expired"]
    @status_filters = ["proposal", "design", "implementation", "evaluation"]
  end

  def show
    @problem = Problem.find(params[:id])
    @proposals = @problem.proposals.page
  end



end
