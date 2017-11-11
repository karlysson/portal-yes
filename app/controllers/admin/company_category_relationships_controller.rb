class Admin::CompanyCategoryRelationshipsController < ApplicationController
  before_action :set_company_category_relationship, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /company_category_relationships
  def index
    if params[:search]
      @company_category_relationships = CompanyCategoryRelationship.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @company_category_relationships = CompanyCategoryRelationship.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /company_category_relationships/1
  def show
  end

  # GET /company_category_relationships/new
  def new
    @company_category_relationship = CompanyCategoryRelationship.new
  end

  # GET /company_category_relationships/1/edit
  def edit
  end

  # POST /company_category_relationships
  def create
    @company_category_relationship = CompanyCategoryRelationship.new(company_category_relationship_params)

    if @company_category_relationship.save
      redirect_to [:admin, @company_category_relationship], notice: "Categoria Relacional #{@company_category_relationship.company_category.name}, Cadastrada com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /company_category_relationships/1
  def update
    if @company_category_relationship.update(company_category_relationship_params)
      redirect_to [:admin, @company_category_relationship], notice: "Categoria Relacional #{@company_category_relationship.company_category.name}, Atualizada com sucesso."
    else
      render :edit
    end
  end

  # DELETE /company_category_relationships/1
  def destroy
    @company_category_relationship.destroy
    redirect_to admin_company_category_relationships_url, notice: "Categoria Relacional #{@company_category_relationship.company_category.name}, Excluída com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_category_relationship
      @company_category_relationship = CompanyCategoryRelationship.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_category_relationship_params
      params.require(:company_category_relationship).permit(:company_id, :company_category_id)
    end
end
