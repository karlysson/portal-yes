class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'admin/application'

  # GET /users
  def index
    if params[:search]
      @users = User.search(params[:search]).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
      @users = User.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:admin, @user], notice: "Usuário #{@user.name} foi Cadastrado com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update

    passwd = params[:user] [:password]
    passwd_confirmation = params[:user] [:password_confirmation]

    if passwd.blank? && passwd_confirmation.blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(user_params)
      redirect_to [:admin, @user], notice: "Usuário #{@user.name} foi Atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to admin_users_url, notice: "Usuário #{@user.name} foi Excluído com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:status, :photo, :sex, :name, :permission_id, :email, :password, :password_confirmation)
    end
end
