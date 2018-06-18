class Admin::ProblemsController < Admin::BaseController
  load_and_authorize_resource
  before_action :load_geozones, only: [:new, :create, :edit, :update]

  before_action :create_project, only: [:create]

  def show
  end

  def index
  end

  def new
  end

  def create_project
    @problem.project = Project.new(name: @problem.title)
  end

  def create
    if @problem.save
      redirect_to admin_problems_url, notice: t("flash.actions.create.problem")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @problem.update(problem_params)
      redirect_to admin_problems_url, notice: t("flash.actions.update.problem")
    else
      render :edit
    end
  end

  def destroy
    if Problem.find(params[:id]).destroy
      redirect_to admin_problems_url, notice: t("flash.actions.destroy.problem")
    else
      redirect_to admin_problems_url, notice: t("flash.actions.destroy.error")
    end
  end

private
  def load_geozones
    @geozones = Geozone.all.order(:name)
  end

  def problem_params
    params.require(:problem).permit(:title, :summary, :status, :description, :starts_at, :ends_at, :cause, :consequence, :budget, :problem_title, :call_to_action, :challenge_poll, :challenge_design, :challenge_proposal,:restriction, :restriction_summary, :user_id, :geozone_restricted, :verification_required, geozone_ids: [], restrictions_attributes: [:description, :id, :_destroy])
  end

end
