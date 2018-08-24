class SessionsController < ApplicationController
  before_action :require_sign_in2!, only: [:destroy]
  before_action :set_crew, only: [:create]

  def new
  end

  def create
    if @crew.authenticate(session_params[:password])
     sign_in2(@crew)
     #redirect_to action: `index`
      redirect_to "/user/user_top"
   else
     flash.now[:danger] = t('.flash.invalid_password')
     render 'new'
   end
  end

  def destroy
    sign_out2
    redirect_to "/menu/menu_top"
  end

  def index
    @crew = Session.find(params[:id])
  end

  def set_crew
      @crew = Crew.find_by!(crew_number: session_params[:crew_number])
    rescue
      flash.now[:danger] = t('.flash.invalid_mail')
      render action: 'new'
    end

    # 許可するパラメータ
    def session_params
      params.require(:session).permit(:crew_number, :password)
    end
end
