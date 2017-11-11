class Admin::PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /pages
  def index
    if params[:search]
      @pages = Page.search(params[:search]).order(id: :desc).paginate(:page => params[:page], :per_page => 10)
    else
      @pages = Page.all.order(id: :desc).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /pages/1
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to [:admin, @page], notice: 'Page was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      redirect_to [:admin, @page], notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    redirect_to pages_url, notice: 'Page was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def page_params
      params.require(:page).permit(:status, :name, :title, :summary, :description)
    end
end
