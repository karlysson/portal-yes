class Admin::CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /companies
  def index
    if params[:search]
      @companies = Company.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @companies = Company.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /companies/1
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
    3.times { @company.assets.build }
  end

  # GET /companies/1/edit
  def edit
    3.times { @company.assets.build }
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to [:admin, @company], notice: "Empresa #{@company.name}, Cadastrada com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      redirect_to [:admin, @company], notice: "Empresa #{@company.name}, Atualizada com sucesso."
    else
      render :edit
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
    redirect_to admin_companies_url, notice: "Empresa #{@company.name}, Excluída com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_params
      params.require(:company).permit(:logo, :name, :title, :city_id, :address, :phone, :email, :latitude, :longitude, :zip_code, :initial_care, :end_care, :initial_interval, :end_range, :md_facebook, :md_google, :md_twitter, :obs, :assets, assets_attributes: [:id, :img, :image, :_destroy])
    end
end
