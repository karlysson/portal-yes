class Admin::JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /jobs
  def index
    if params[:search]
      @jobs = Job.all
      @aguardando = Job.search(params[:search]).where(:status => 'a').order(:id).paginate(:page => params[:page], :per_page => 5)
      @analise = Job.search(params[:search]).where(:status => 'e').order(:id).paginate(:page => params[:page], :per_page => 5)
      @cancelado = Job.search(params[:search]).where(:status => 'c').order(:id).paginate(:page => params[:page], :per_page => 5)
      @concluido = Job.search(params[:search]).where(:status => 'u').order(:id).paginate(:page => params[:page], :per_page => 5)
      @todos = Job.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 5)
    else
      @jobs = Job.all
      @aguardando = Job.where(:status => 'a').order(:id).paginate(:page => params[:page], :per_page => 5)
      @analise = Job.where(:status => 'e').order(:id).paginate(:page => params[:page], :per_page => 5)
      @cancelado = Job.where(:status => 'c').order(:id).paginate(:page => params[:page], :per_page => 5)
      @concluido = Job.where(:status => 'u').order(:id).paginate(:page => params[:page], :per_page => 5)
      @todos = Job.all.order(:id).paginate(:page => params[:page], :per_page => 5)
    end

  end

  # GET /jobs/1
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to [:admin, @job], notice: "Vaga #{@job.name}, Cadastrada com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      redirect_to [:admin, @job], notice: "Vaga #{@job.name}, Atualizada com sucesso."
    else
      render :edit
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
    redirect_to admin_jobs_url, notice: "Vaga #{@job.name}, Excluída com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_params
      params.require(:job).permit(:name, :company_id, :status, :curriculum_profile_id, :curriculum_office_id, :number, :city_id, :teaching, :cnh, :travel, :availability, :visible, :description, :benefit)
    end
end
