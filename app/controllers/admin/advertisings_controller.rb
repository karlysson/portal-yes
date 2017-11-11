class Admin::AdvertisingsController < ApplicationController
  before_action :set_advertising, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /advertisings
  def index
    if params[:search]
      @advertisings = Advertising.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @advertisings = Advertising.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end

  end

  # GET /advertisings/1
  def show
  end

  # GET /advertisings/new
  def new
    @advertising = Advertising.new
    3.times { @advertising.assets.build }
  end

  # GET /advertisings/1/edit
  def edit
    3.times { @advertising.assets.build }
  end

  # POST /advertisings
  def create
    @advertising = Advertising.new(advertising_params)

    if @advertising.save
      redirect_to [:admin, @advertising], notice: "Anúncio #{@advertising.name}, Cadastrado com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /advertisings/1
  def update
    if @advertising.update(advertising_params)
      redirect_to [:admin, @advertising], notice: "Anúncio #{@advertising.name}, Atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /advertisings/1
  def destroy
    @advertising.destroy
    redirect_to admin_advertisings_url, notice: "Anúncio #{@advertising.name}, Excluído com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertising
      @advertising = Advertising.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def advertising_params
      params.require(:advertising).permit(:cover, :name, :description, :advertising_category_id, :company_id, :address, :phone, :email, :site, :choice, :facebook, :instagram, :twitter, :google, :image, :img_content_type, :assets, assets_attributes: [:id, :img, :image, :_destroy])

    end
end
