class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contact = Contact.new
  end

  def show
    @contact = Contact.new
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to @contact, notice: "Obrigado Sr.(a): #{@contact.name}, seu cadastrado foi realizado com sucesso."
    else
      render :new
    end
  end

  private

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:status, :name, :email, :phone, :subject, :message)
    end
end
