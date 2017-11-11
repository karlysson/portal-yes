class Admin::IndicationsController < ApplicationController
  before_action :set_indication, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /indications
  def index
    if params[:search]
      @indications = Indication.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @indications = Indication.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /indications/1
  def show
  end

  # GET /indications/new
  def new
    @indication = Indication.new
  end

  # GET /indications/1/edit
  def edit
  end

  # POST /indications
  def create
    @indication = Indication.new(indication_params)

    if @indication.save
      if @indication.page == "curriculum"
        redirect_to "/admin/curriculums/#{@indication.page_id}/edit", notice: "Indicação #{@indication.name}, Cadastrada com sucesso."
      else
        redirect_to [:admin, @indication], notice: "Indicação #{@indication.name}, Cadastrada com sucesso."
      end
      # redirect_to [:admin, @indication], notice: 'Indication was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /indications/1
  def update
    if @indication.update(indication_params)
      redirect_to [:admin, @indication], notice: "Indicação #{@indication.name}, Atualizada com sucesso."
    else
      render :edit
    end
  end

  # DELETE /indications/1
  def destroy
    @indication.destroy
    redirect_to admin_indications_url, notice: "Indicação #{@indication.name}, Excluída com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indication
      @indication = Indication.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def indication_params
      params.require(:indication).permit(:name, :user_id, :page, :page_id, :phone, :cell, :email, :profession, :obs)
    end
end
