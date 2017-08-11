class Admin::ProjectsController < Admin::BaseController
  load_and_authorize_resource
  before_action :load_geozones, only: [:new, :create, :edit, :update]

  def show
  end

  def index
  end

  def new
  end

  def create
    if @project.save
      redirect_to admin_projects_url, notice: t("flash.actions.create.problem")
    else
      render :new
    end
  end

  def edit
    @project.design_events.build
  end

  def update
    if @project.update(project_params)
      redirect_to admin_projects_url, notice: t("flash.actions.update.project")
    else
      render :edit
    end
  end

  def destroy
  end

private
  def load_geozones
    @geozones = Geozone.all.order(:name)
  end

  def project_params
    params.require(:project).permit(:name, :description, :responsible_official_name, :responsible_official_mail, :starts_at, :ends_at, :geozone_restricted, geozone_ids: [], proposal_ids: [], design_events_attributes: [:starts_at, :name, :place, :pax, :_destroy, :id, :description, :image, :summary] )
  end

end
