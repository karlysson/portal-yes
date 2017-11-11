class Admin::CurriculumCategoriesController < ApplicationController
  before_action :set_curriculum_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /curriculum_categories
  def index
    if params[:search]
      @curriculum_categories = CurriculumCategory.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @curriculum_categories = CurriculumCategory.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /curriculum_categories/1
  def show
  end

  # GET /curriculum_categories/new
  def new
    @curriculum_category = CurriculumCategory.new
  end

  # GET /curriculum_categories/1/edit
  def edit
  end

  # POST /curriculum_categories
  def create
    @curriculum_category = CurriculumCategory.new(curriculum_category_params)

    if @curriculum_category.save
      redirect_to [:admin, @curriculum_category], notice: "Categoria #{@curriculum_category.name}, Cadastrado com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /curriculum_categories/1
  def update
    if @curriculum_category.update(curriculum_category_params)
      redirect_to [:admin, @curriculum_category], notice: "Categoria #{@curriculum_category.name}, Atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /curriculum_categories/1
  def destroy
    @curriculum_category.destroy
    redirect_to admin_curriculum_categories_url, notice: "Categoria #{@curriculum_category.name}, Excluído com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum_category
      @curriculum_category = CurriculumCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def curriculum_category_params
      params.require(:curriculum_category).permit(:name)
    end
end
