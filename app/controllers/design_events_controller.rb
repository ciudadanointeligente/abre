class DesignEventsController < ApplicationController
  skip_authorization_check

  def index
    @project = Project.find(params[:project_id])
    @problem = Problem.find(params[:problem_id])
    @design_events = @project.design_events
  end

end
