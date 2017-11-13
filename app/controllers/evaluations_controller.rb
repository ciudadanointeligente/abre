class EvaluationsController < ApplicationController
  skip_authorization_check

  def index
    @project = Project.find(params[:project_id])
    @problem = Problem.find(params[:problem_id])
    # @evaluations = @project.evaluations
  end

end
