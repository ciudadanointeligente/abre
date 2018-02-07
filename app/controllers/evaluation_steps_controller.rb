class EvaluationStepsController < ApplicationController
  include Wicked::Wizard
  skip_authorization_check
  steps :participation, :evaluation, :tries

  def show
    p params
    @evaluation = Evaluation.find(params[:evaluation_id])
    if params[:problem_id].present?
      @problem = Problem.find(params[:problem_id].to_i)
    end
    if params[:project_id].present?
      @project = Project.find(params[:project_id].to_i)
    end
    # Busca una plantilla para cada paso definido en steps
    render_wizard
  end

  def update
    p params
    p params[:evaluation_id].to_i
    @evaluation = Evaluation.find(params[:evaluation_id].to_i)
    p @evaluation
    @evaluation.update_attributes(evaluation_params)
    render_wizard @evaluation,  evaluation_id: @evaluation.id
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:proposal_participation)
  end

end
