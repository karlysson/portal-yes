class PageController < ApplicationController

  def quem_somos
    @pages = Page.where(:id => 1)
  end

  def vagas
    @pages = Page.where(:id => 2)
  end

  def planos
    @pages = Page.where(:id => 4)
  end

  def empresas
    @pages = Page.where(:id => 5)
    @companies = Company.all
  end

  def localizacao
    @pages = Page.where(:id => 6)
  end

  def consultoria
    @pages = Page.where(:id => 7)
  end

  def consultoria_empresa
    @pages = Page.where(:id => 8)
  end

  def eja
    @pages = Page.where(:id => 9)
  end

end
