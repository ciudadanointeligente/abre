class Admin::ReportsController < ApplicationController
    load_and_authorize_resource

    def index
      @problem = Problem.find(params["problem_id"])
      @project = Project.find(params["project_id"])
      @reports = Report.where(project: @project)
    end

    def show
      @problem = Problem.find(params["problem_id"])
      @project = Project.find(params["project_id"])
    end

    def edit
      @problem = Problem.find(params["problem_id"])
      @project = Project.find(params["project_id"])
    end

    def update
      @project = Project.find(params["project_id"])
      @problem = Problem.find(params["report"]["problem_id"])
      @report.update(report_params)
      if @report.save
        redirect_to admin_project_reports_path(@project, :problem_id => @problem), notice: "Se han guardado correctamente los cambios"
      else
        render :new
      end
    end

    def create
      @project = Project.find(params["project_id"])
      @problem = Problem.find(params["report"]["problem_id"])
      if @report.save
        redirect_to admin_project_reports_path(@project, :problem_id => @problem), notice: "Se han guardado correctamente los cambios"
      else
        render :new
      end

    end

    def new
      @problem = Problem.find(params["problem_id"])
      @project = Project.find(params["project_id"])
    end

    def destroy
      @project = Project.find(params["project_id"])
      @problem = Problem.find(params["problem_id"])
      if @report.destroy
        redirect_to admin_project_reports_path(@project, :problem_id => @problem), notice: "Se han guardado correctamente los cambios"
      else
        render :new
      end
    end

    private

    def report_params
      params.require(:report).permit(:description, :id, :project_id, pictures_attributes: [:id, :_destroy, :image])
    end


end
