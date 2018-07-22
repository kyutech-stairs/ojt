class UserController < ApplicationController
  def user_top
    #@crew = Crew.find(session[:crew_id])
  end
  def check_rist
    @sirabasus = Sirabasu.all
  end
  def sirabasu
    @sirabasus = Sirabasu.all
  end
end
