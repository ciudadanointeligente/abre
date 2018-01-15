class EvaluationStepsController < ApplicationController
  include Wicked::Wizard
  skip_authorization_check
  steps :participation, :evaluation, :tries

  def show
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
    @evaluation = current_evaluation
    @evaluation.attributes = params[:evaluation]
    render_wizard @evaluation
  end

end
