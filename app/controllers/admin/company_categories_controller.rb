class Admin::CompanyCategoriesController < ApplicationController
  before_action :set_company_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /company_categories
  def index
    if params[:search]
      @company_categories = CompanyCategory.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @company_categories = CompanyCategory.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /company_categories/1
  def show
  end

  # GET /company_categories/new
  def new
    @company_category = CompanyCategory.new
  end

  # GET /company_categories/1/edit
  def edit
  end

  # POST /company_categories
  def create
    @company_category = CompanyCategory.new(company_category_params)

    if @company_category.save
      redirect_to [:admin, @company_category], notice: "Categoria #{@company_category.name}, Cadastrada com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /company_categories/1
  def update
    if @company_category.update(company_category_params)
      redirect_to [:admin, @company_category], notice: "Categoria #{@company_category.name}, Atualizada com sucesso."
    else
      render :edit
    end
  end

  # DELETE /company_categories/1
  def destroy
    @company_category.destroy
    redirect_to admin_company_categories_url, notice: "Categoria #{@company_category.name}, Excluída com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_category
      @company_category = CompanyCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_category_params
      params.require(:company_category).permit(:name)
    end
end
