class Admin::DiagramsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin/application'

  def index
      %x(bundle exec erd --filename='public/diagram')
  end
end
