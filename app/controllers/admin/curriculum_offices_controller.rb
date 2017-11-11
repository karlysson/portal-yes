class Admin::CurriculumOfficesController < ApplicationController
  before_action :set_curriculum_office, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /curriculum_offices
  def index
    if params[:search]
      @curriculum_offices = CurriculumOffice.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @curriculum_offices = CurriculumOffice.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /curriculum_offices/1
  def show
  end

  # GET /curriculum_offices/new
  def new
    @curriculum_office = CurriculumOffice.new
  end

  # GET /curriculum_offices/1/edit
  def edit
  end

  # POST /curriculum_offices
  def create
    @curriculum_office = CurriculumOffice.new(curriculum_office_params)

    if @curriculum_office.save
      redirect_to [:admin, @curriculum_office], notice: "Cargo #{@curriculum_office.name}, Cadastrado com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /curriculum_offices/1
  def update
    if @curriculum_office.update(curriculum_office_params)
      redirect_to [:admin, @curriculum_office], notice: "Cargo #{@curriculum_office.name}, Atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /curriculum_offices/1
  def destroy
    @curriculum_office.destroy
    redirect_to admin_curriculum_offices_url, notice: "Cargo #{@curriculum_office.name}, Excluído com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum_office
      @curriculum_office = CurriculumOffice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def curriculum_office_params
      params.require(:curriculum_office).permit(:name, :curriculum_category_id)
    end
end
