class Admin::AdvertisingCategoriesController < ApplicationController
  before_action :set_advertising_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /advertising_categories
  def index
    if params[:search]
      @advertising_categories = AdvertisingCategory.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @advertising_categories = AdvertisingCategory.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end

  end

  # GET /advertising_categories/1
  def show
  end

  # GET /advertising_categories/new
  def new
    @advertising_category = AdvertisingCategory.new
  end

  # GET /advertising_categories/1/edit
  def edit
  end

  # POST /advertising_categories
  def create
    @advertising_category = AdvertisingCategory.new(advertising_category_params)

    if @advertising_category.save
      redirect_to [:admin, @advertising_category], notice: "Categoria #{@advertising_category.name}, Cadastrada com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /advertising_categories/1
  def update
    if @advertising_category.update(advertising_category_params)
      redirect_to [:admin, @advertising_category], notice: "Categoria #{@advertising_category.name}, Atualizada com sucesso."
    else
      render :edit
    end
  end

  # DELETE /advertising_categories/1
  def destroy
    @advertising_category.destroy
    redirect_to admin_advertising_categories_url, notice: "Categoria #{@advertising_category.name}, Excluída com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertising_category
      @advertising_category = AdvertisingCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def advertising_category_params
      params.require(:advertising_category).permit(:name, :color, :font)
    end
end
