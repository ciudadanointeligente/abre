class EvaluationsController < ApplicationController
  skip_authorization_check

  def index
    @project = Project.find(params[:project_id])
    @problem = Problem.find(params[:problem_id])
    # @evaluations = @project.evaluations
  end

  def new
    @evaluation = Evaluation.new
    if params[:problem_id].present?
      @problem = Problem.find(params[:problem_id].to_i)
    end
    if params[:project_id].present?
      @project = Project.find(params[:project_id].to_i)
    end
    if @evaluation.save
      session[:evaluation_id] = @evaluation.id
      redirect_to project_evaluation_steps_path(:problem_id => @problem.id)
    else
      render :new
    end
  end

  # def create
  #   @evaluation = Evaluation.new(params[:evaluation])
  #   if params[:project_id].present?
  #     @project = Project.find(params[:project_id].to_i)
  #   end
  #
  #   if @evaluation.save
  #     session[:evaluation_id] = @evaluation.id
  #     redirect_to project_evaluation_steps_path, notice: "Thank you for signing up."
  #   else
  #     render :new
  #   end
  # end


private

  def evaluations_params
    params.require(:evaluation).permit(:proposal_participation)
  end


end
