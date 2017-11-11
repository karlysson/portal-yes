class Admin::CourseInterationsController < ApplicationController
  before_action :set_course_interation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /course_interations
  def index
    if params[:search]
      @course_interations = CourseInteration.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @course_interations = CourseInteration.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /course_interations/1
  def show
  end

  # GET /course_interations/new
  def new
    @course_interation = CourseInteration.new
  end

  # GET /course_interations/1/edit
  def edit
  end

  # POST /course_interations
  def create
    @course_interation = CourseInteration.new(course_interation_params)

    if @course_interation.save
      if @course_interation.page == "curriculum"
        redirect_to"/admin/curriculums/#{@course_interation.page_id}/edit", notice: "Integração #{@course_interation.course.name}, Cadastrada com sucesso."
      else
        redirect_to [:admin, @course_interation], notice: 'Course interation was successfully created.'
      end
    else
      render :new
    end
  end

  # PATCH/PUT /course_interations/1
  def update
    if @course_interation.update(course_interation_params)
      redirect_to [:admin, @course_interation], notice: "Integração #{@course_interation.course.name}, Ataualizada com sucesso."
    else
      render :edit
    end
  end

  # DELETE /course_interations/1
  def destroy
    @course_interation.destroy
    redirect_to admin_course_interations_url, notice: "Integração #{@course_interation.course.name}, Excluída com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_interation
      @course_interation = CourseInteration.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def course_interation_params
      params.require(:course_interation).permit(:course_id, :user_id, :page, :page_id, :others)
    end
end
