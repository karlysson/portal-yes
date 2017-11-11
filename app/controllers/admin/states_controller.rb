class Admin::StatesController < ApplicationController
  before_action :set_state, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /states
  def index
    if params[:search]
      @states = State.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @states = State.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /states/1
  def show
  end

  # GET /states/new
  def new
    @state = State.new
  end

  # GET /states/1/edit
  def edit
  end

  # POST /states
  def create
    @state = State.new(state_params)

    if @state.save
      redirect_to [:admin, @state], notice: "Estado #{@state.name} cadastrado com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /states/1
  def update
    if @state.update(state_params)
      redirect_to [:admin, @state], notice: "Estado #{@state.name} Atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /states/1
  def destroy
    @state.destroy
    redirect_to admin_states_url, notice: "Estado #{@state.name} Excluído com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def state_params
      params.require(:state).permit(:name, :sigla)
    end
end
