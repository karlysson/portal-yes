class Admin::PermissionsController < ApplicationController
  # before_action :set_permission, only: [:show, :edit, :update, :destroy]
  before_action :set_permission, only: [:show]
  before_action :authenticate_user!
  layout 'admin/application'
  
  # GET /permissions
  def index
    @permissions = Permission.all
  end

  # GET /permissions/1
  def show
  end

  # GET /permissions/new
  # def new
  #   @permission = Permission.new
  # end

  # GET /permissions/1/edit
  # def edit
  # end

  # POST /permissions
  # def create
  #   @permission = Permission.new(permission_params)

  #   if @permission.save
  #     redirect_to [:admin, @permission], notice: 'Permission was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  # PATCH/PUT /permissions/1
  # def update
  #   if @permission.update(permission_params)
  #     redirect_to [:admin, @permission], notice: 'Permission was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # DELETE /permissions/1
  # def destroy
  #   @permission.destroy
  #   redirect_to admin_permissions_url, notice: 'Permission was successfully destroyed.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission
      @permission = Permission.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def permission_params
      params.require(:permission).permit(:name, :prefix, :obs)
    end
end
