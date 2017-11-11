class Admin::BannersController < ApplicationController
  before_action :set_banner, only: [:show, :edit, :update, :destroy]
  layout 'admin/application'

  # GET /banners
  def index
    if params[:search]
      @banners = Banner.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @banners = Banner.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /banners/1
  def show
  end

  # GET /banners/new
  def new
    @banner = Banner.new
  end

  # GET /banners/1/edit
  def edit
  end

  # POST /banners
  def create
    @banner = Banner.new(banner_params)

    if @banner.save
      redirect_to [:admin, @banner], notice: 'Banner was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /banners/1
  def update
    if @banner.update(banner_params)
      redirect_to [:admin, @banner], notice: 'Banner was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /banners/1
  def destroy
    @banner.destroy
    redirect_to admin_banners_url, notice: 'Banner was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banner
      @banner = Banner.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def banner_params
      params.require(:banner).permit(:name, :image, :order, :url, :status, :target)
    end
end
