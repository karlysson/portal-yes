class Admin::CurriculumsController < ApplicationController
  before_action :set_curriculum, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  before_action :set_indication, :set_reference, :set_course_interation
  def set_reference
    @indication = Indication.new
    @indications = Indication.all
  end
  def set_indication
    @references = Reference.all
    @reference = Reference.new
  end
  def set_course_interation
    @course_interation = CourseInteration.new 
    @course_interations = CourseInteration.all 
  end

  # GET /curriculums
  def index
    if params[:search]
      @curriculums = Curriculum.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 5)
      @aguardando = Curriculum.search(params[:search]).where(:status => 'a').order(:id).paginate(:page => params[:page], :per_page => 5)
      @aprovado = Curriculum.search(params[:search]).where(:status => 'p').order(:id).paginate(:page => params[:page], :per_page => 5)
      @empregado = Curriculum.search(params[:search]).where(:status => 'e').order(:id).paginate(:page => params[:page], :per_page => 5)
      @todos = Curriculum.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 5)
    else
      @curriculums = Curriculum.all.order(:id).paginate(:page => params[:page], :per_page => 5)
      @aguardando = Curriculum.where(:status => 'a').order(:id).paginate(:page => params[:page], :per_page => 5)
      @aprovado = Curriculum.where(:status => 'p').order(:id).paginate(:page => params[:page], :per_page => 5)
      @empregado = Curriculum.where(:status => 'e').order(:id).paginate(:page => params[:page], :per_page => 5)
      @todos = Curriculum.all.order(:id).paginate(:page => params[:page], :per_page => 5)
    end


  end

  # GET /curriculums/1
  def show
    @references = Reference.where(:user_id => current_user.id)
    @indications = Indication.where(:user_id => current_user.id)
    @course_interations = CourseInteration.where(:user_id => current_user.id)
  end

  # GET /curriculums/new
  def new
    @curriculum = Curriculum.new
    @reference = Reference.new
    @indication = Indication.new
    @course_interation = CourseInteration.new
    @references = Reference.where(:user_id => current_user.id)
    @indications = Indication.where(:user_id => current_user.id)
    @course_interations = CourseInteration.where(:user_id => current_user.id)
  end

  # GET /curriculums/1/edit
  def edit
    @reference = Reference.new
    @indication = Indication.new
    @course_interation = CourseInteration.new
    @references = Reference.where(:user_id => current_user.id).where(:page_id => params[:id])
    @indications = Indication.where(:user_id => current_user.id).where(:page_id => params[:id])
    @course_interations = CourseInteration.where(:user_id => current_user.id).where(:page_id => params[:id])
  end

  # POST /curriculums
  def create
    @curriculum = Curriculum.new(curriculum_params)

    if @curriculum.save
      redirect_to "/admin/curriculums/#{@curriculum.id}/edit", notice: "Currículo #{@curriculum.name}, Cadastrado com sucesso."
      # redirect_to [:admin, @curriculum], notice: 'Curriculum was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /curriculums/1
  def update
    if @curriculum.update(curriculum_params)
      redirect_to [:admin, @curriculum], notice: "Currículo #{@curriculum.name}, Atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /curriculums/1
  def destroy
    @curriculum.destroy
    redirect_to admin_curriculums_url, notice: "Currículo #{@curriculum.name}, Excluído com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum
      @curriculum = Curriculum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def curriculum_params
      params.require(:curriculum).permit(:status, :name, :birth, :marital_status, :identity, :cpf, :elector_title, :inscription, :zone, :section, :cnh, :professional_experience, :professional_preference, :email, :address, :street, :block, :lot, :sector, :city_id, :zip_code, :phone, :cell_phone, :message, :study, :teaching, :period, :courses, :employee, :salary, :father, :profession_father, :mother, :profession_mother, :curriculum_office_id)
    end
end