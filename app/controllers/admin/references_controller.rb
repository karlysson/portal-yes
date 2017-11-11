class Admin::ReferencesController < ApplicationController
  before_action :set_reference, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /references
  def index
    if params[:search]
      @references = Reference.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @references = Reference.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /references/1
  def show
  end

  # GET /references/new
  def new
    @reference = Reference.new
    # respond_to do |f|
    #   f.js
    # end
  end

  # GET /references/1/edit
  def edit
  end

  # POST /references
  def create
    @reference = Reference.new(reference_params)

    if @reference.save
      if @reference.page == "curriculum"
        redirect_to "/admin/curriculums/#{@reference.page_id}/edit", notice: "Referência #{@reference.name}, Cadastrado com sucesso."
      else
        redirect_to [:admin, @reference], notice: 'Reference was successfully created.'
      end
      # redirect_to admin_curriculums_url, notice: 'Reference was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /references/1
  def update
    if @reference.update(reference_params)
      redirect_to [:admin, @reference], notice: "Referência #{@reference.name}, Atualizada com sucesso."
    else
      render :edit
    end
  end

  # DELETE /references/1
  def destroy
    @reference.destroy
    redirect_to admin_references_url, notice: "Referência #{@reference.name}, Excluída com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reference
      @reference = Reference.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reference_params
      params.require(:reference).permit(:page, :page_id, :name, :phone, :user_id)
    end
end
