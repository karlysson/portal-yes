class Admin::CurriculumProfilesController < ApplicationController
  before_action :set_curriculum_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /curriculum_profiles
  def index
    if params[:search]
      @curriculum_profiles = CurriculumProfile.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @curriculum_profiles = CurriculumProfile.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /curriculum_profiles/1
  def show
  end

  # GET /curriculum_profiles/new
  def new
    @curriculum_profile = CurriculumProfile.new
  end

  # GET /curriculum_profiles/1/edit
  def edit
  end

  # POST /curriculum_profiles
  def create
    @curriculum_profile = CurriculumProfile.new(curriculum_profile_params)

    if @curriculum_profile.save
      redirect_to [:admin, @curriculum_profile], notice: "Perfil #{@curriculum_profile.name}, Cadastrado com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /curriculum_profiles/1
  def update
    if @curriculum_profile.update(curriculum_profile_params)
      redirect_to [:admin, @curriculum_profile], notice: "Perfil #{@curriculum_profile.name}, Atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /curriculum_profiles/1
  def destroy
    @curriculum_profile.destroy
    redirect_to admin_curriculum_profiles_url, notice: "Perfil #{@curriculum_profile.name}, Excluído com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum_profile
      @curriculum_profile = CurriculumProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def curriculum_profile_params
      params.require(:curriculum_profile).permit(:name)
    end
end
