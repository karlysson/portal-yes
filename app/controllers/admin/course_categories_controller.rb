class Admin::CourseCategoriesController < ApplicationController
  before_action :set_course_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /course_categories
  def index
    if params[:search]
      @course_categories = CourseCategory.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @course_categories = CourseCategory.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /course_categories/1
  def show
  end

  # GET /course_categories/new
  def new
    @course_category = CourseCategory.new
  end

  # GET /course_categories/1/edit
  def edit
  end

  # POST /course_categories
  def create
    @course_category = CourseCategory.new(course_category_params)

    if @course_category.save
      redirect_to [:admin, @course_category], notice: "Categoria #{@course_category.name}, Cadastrada com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /course_categories/1
  def update
    if @course_category.update(course_category_params)
      redirect_to [:admin, @course_category], notice: "Categoria #{@course_category.name}, Atualizada com sucesso."
    else
      render :edit
    end
  end

  # DELETE /course_categories/1
  def destroy
    @course_category.destroy
    redirect_to admin_course_categories_url, notice: "Categoria #{@course_category.name}, Excluída com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_category
      @course_category = CourseCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def course_category_params
      params.require(:course_category).permit(:name)
    end
end
