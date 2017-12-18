class EvaluationsController < ApplicationController
  skip_authorization_check

  def index
    @project = Project.find(params[:project_id])
    @problem = Problem.find(params[:problem_id])
    # @evaluations = @project.evaluations
  end

  def new
    # @evaluation = Evaluation.new
    if params[:problem].present?
      @problem = Problem.find(params[:problem].to_i)
    end
  end


private

  def evaluations_params
    params.require(:evaluation).permit(:proposal_participation)
  end


end
