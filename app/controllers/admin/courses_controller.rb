class Admin::CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /courses
  def index
    if params[:search]
      @courses = Course.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @courses = Course.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /courses/1
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to [:admin, @course], notice: "Curso #{@course.name}, Cadastradado com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      redirect_to [:admin, @course], notice: "Curso #{@course.name}, Atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to admin_courses_url, notice: "Curso #{@course.name}, Excluído com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def course_params
      params.require(:course).permit(:name, :user_id, :course_category_id, :workload, :obs)
    end
end
