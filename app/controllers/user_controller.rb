class UserController < ApplicationController
  before_action :current_crew
  before_action :require_sign_in2!
  helper_method :signed_in2?

  protect_from_forgery with: :exception

  def user_top

  end
  def check_rist
    @sirabasus = Sirabasu.all
    @checklists = Checklist.all
  end
  def sirabasu
    @sirabasus = Sirabasu.all
  end

end
