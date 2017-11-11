class Admin::ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /contacts
  def index
    if params[:search]
      @contacts = Contact.all
      @aguardando = Contact.search(params[:search]).where(:status => 'a').order(:id).paginate(:page => params[:page], :per_page => 5)
      @analise = Contact.search(params[:search]).where(:status => 'e').order(:id).paginate(:page => params[:page], :per_page => 5)
      @cancelado = Contact.search(params[:search]).where(:status => 'c').order(:id).paginate(:page => params[:page], :per_page => 5)
      @concluido = Contact.search(params[:search]).where(:status => 'u').order(:id).paginate(:page => params[:page], :per_page => 5)
      @todos = Contact.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 5)
    else
      @contacts = Contact.all
      @aguardando = Contact.where(:status => 'a').order(:id).paginate(:page => params[:page], :per_page => 5)
      @analise = Contact.where(:status => 'e').order(:id).paginate(:page => params[:page], :per_page => 5)
      @cancelado = Contact.where(:status => 'c').order(:id).paginate(:page => params[:page], :per_page => 5)
      @concluido = Contact.where(:status => 'u').order(:id).paginate(:page => params[:page], :per_page => 5)
      @todos = Contact.all.order(:id).paginate(:page => params[:page], :per_page => 5)
    end

  end

  # GET /contacts/1
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to [:admin, @contact], notice: "Contato #{@contact.name}, Cadastrado com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      redirect_to [:admin, @contact], notice: "Contato #{@contact.name}, Atualizada com sucesso."
    else
      render :edit
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    redirect_to admin_contacts_url, notice: "Contato #{@contact.name}, Excluído com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(:status, :name, :email, :phone, :subject, :message)
    end
end
