class ProblemsController < ApplicationController
  load_and_authorize_resource
  has_filters %w{active expired}

  def index
    @problems = @problems.send(@current_filter).page(params[:page])
  end

  def show
    @problem = Problem.find(params[:id])
    @proposals = @problem.proposals.page


  end



end
