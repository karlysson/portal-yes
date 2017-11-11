class AnuncioController < ApplicationController
	def index
		@pages = Page.where(:id => 3)
		@advertisings = Advertising.all
	end

	def show
		@advertisings = Advertising.all
	end


	private
	# Use callbacks to share common setup or constraints between actions.
	def set_advertising
	  @advertising = Advertising.find(params[:id])
	end

	# Only allow a trusted parameter "white list" through.
	def advertising_params
	  params.require(:advertising).permit(:cover, :name, :description, :advertising_category_id, :company_id, :address, :phone, :email, :site, :choice, :facebook, :instagram, :twitter, :google, :image, :img_content_type, :assets, assets_attributes: [:id, :img, :image, :_destroy])

	end

end
