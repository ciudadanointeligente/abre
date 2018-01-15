class ReportsController < ApplicationController
  skip_authorization_check

  def show
    @report = Report.find(params[:id])
    @problem = Problem.find(params[:problem_id])
  end

  def index
    @project = Project.find(params[:project_id])
    @problem = Problem.find(params[:problem_id])
    @reports = @project.reports
  end


end
