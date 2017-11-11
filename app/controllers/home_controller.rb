class HomeController < ApplicationController
  def index

  	@banners = Banner.where(:status => "Ativo").order(:order)
  	
  end
end
