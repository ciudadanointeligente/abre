class Admin::EvaluationsController < Admin::BaseController
  load_and_authorize_resource

    def index
      @problem = Problem.find(params["problem_id"])
      @project = Project.find(params["project_id"])
      @evaluations = Evaluation.where(project: @project)
    end

    def show
      @problem = Problem.find(params["problem_id"])
      @project = Project.find(params["project_id"])
    end


end
