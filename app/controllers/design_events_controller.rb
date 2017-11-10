class DesignEventsController < ApplicationController
  skip_authorization_check

  def index
    p params
    @design_events = Project.find(params[:project_id]).design_events

  end

end
