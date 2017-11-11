class Admin::HomeController < ApplicationController
  before_action :authenticate_user!
  layout 'admin/application'

  def index
    @curriculums = Curriculum.all
    @advertisings = Advertising.all
    @jobs = Job.all
    @users = User.all
    @companies = Company.all
    @contacts = Contact.all
    @contacts_limited = Contact.limit(6).order(:id).where(:status => 'a')
    @curriculums_limited = Curriculum.limit(6).order(:id).where(:status => 'a')
    @companies_limited = Company.limit(8)
    @users_limited = User.limit(8)
  end
end
