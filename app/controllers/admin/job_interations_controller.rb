class Admin::JobInterationsController < ApplicationController
  before_action :set_job_interation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /job_interations
  def index
    @job_interations = JobInteration.all.order(:id).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /job_interations/1
  def show
  end

  # GET /job_interations/new
  def new
    @job_interation = JobInteration.new
  end

  # GET /job_interations/1/edit
  def edit
  end

  # POST /job_interations
  def create
    @job_interation = JobInteration.new(job_interation_params)

    if @job_interation.save
      redirect_to [:admin, @job_interation], notice: 'Job interation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /job_interations/1
  def update
    if @job_interation.update(job_interation_params)
      redirect_to [:admin, @job_interation], notice: 'Job interation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /job_interations/1
  def destroy
    @job_interation.destroy
    redirect_to admin_job_interations_url, notice: 'Job interation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_interation
      @job_interation = JobInteration.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_interation_params
      params.require(:job_interation).permit(:page, :page_id, :job_id, :course_id)
    end
end
