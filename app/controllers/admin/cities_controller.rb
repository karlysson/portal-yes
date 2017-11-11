class Admin::CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /cities
  def index
    if params[:search]
      @cities = City.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @cities = City.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /cities/1
  def show
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to [:admin, @city], notice: "Cidade #{@city.name} Cadastrado com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /cities/1
  def update
    if @city.update(city_params)
      redirect_to [:admin, @city], notice: "Cidade #{@city.name} Atualizada com sucesso."
    else
      render :edit
    end
  end

  # DELETE /cities/1
  def destroy
    @city.destroy
    redirect_to admin_cities_url, notice: "Cidade #{@city.name} Excluída com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def city_params
      params.require(:city).permit(:name, :state_id)
    end
end
