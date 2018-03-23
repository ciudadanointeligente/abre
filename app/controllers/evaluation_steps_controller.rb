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
    render_wizard(@evaluation, {}, {evaluation_id: @evaluation.id, project_id: params[:project_id], problem_id: params[:problem_id]})
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:proposal_participation, :proposal_web_participation, :design_participation, :design_participation_2, :implementation_participation, :implementation_participation_2, :proposal_evaluation, :proposal_web_evaluation, :design_evaluation, :design_evaluation_2, :implementation_evaluation, :implementation_evaluation_2, :proposal, :proposal_web, :design, :design_2, :implementation, :implementation_2)
  end

  def redirect_to_finish_wizard(p1, p2)
    p "PARAM 1"
    p p1
    p "param 2"
    p p2
    redirect_to project_evaluations_path(:evaluation_id => @evaluation.id, :problem_id => @problem.id), notice: "Gracias por participar en la evaluación"
  end

end
