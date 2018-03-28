class Admin::DesignEventsController < Admin::BaseController
  load_and_authorize_resource

    def index
      @problem = Problem.find(params["problem_id"])
      @project = Project.find(params["project_id"])
    end

    def show
    end


    def edit
      @problem = Problem.find(params["problem_id"])
      @project = Project.find(params["project_id"])
    end

    def update
      @project = Project.find(params["project_id"])
      @problem = Problem.find(params["problem_id"])
      if @design_event.save
        redirect_to admin_project_design_events_path(@project, :problem_id => @problem), notice: "Se han guardado correctamente los cambios"
      else
        render :new
      end
    end

    def create
      @project = Project.find(params["project_id"])
      @problem = Problem.find(params["problem_id"])
      if @design_event.save
        redirect_to admin_project_design_events_path(@project, :problem_id => @problem), notice: "Se han guardado correctamente los cambios"
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
      if @design_event.destroy
        redirect_to admin_project_design_events_path(@project, :problem_id => @problem), notice: "Se han guardado correctamente los cambios"
      else
        render :new
      end
    end

private


def design_event_params
  params.require(:design_event).permit(:starts_at, :name, :place, :pax, :id, :description, :summary, :document, pictures_attributes: [:id, :_destroy, :image])
end



end
