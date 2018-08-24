class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  #before_action :current_crew
  #before_action :require_sign_in!
  #helper_method :signed_in?

  protect_from_forgery with: :exception

  def current_crew
    remember_token = Crew.encrypt(cookies[:crew_remember_token])
    @current_crew ||= Crew.find_by(remember_token: remember_token)
  end

  def sign_in2(crew)
    remember_token = Crew.new_remember_token
    cookies.permanent[:crew_remember_token] = remember_token
    crew.update!(remember_token: Crew.encrypt(remember_token))
    @current_crew = crew
  end

  def sign_out2
    @current_crew = nil
    cookies.delete(:crew_remember_token)
  end

  def signed_in2?
    @current_crew.present?
  end

  private

    def require_sign_in2!
      redirect_to login_path unless signed_in2?
    end

   protected

     def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :crew_number, :sex])
       devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, :crew_number, :sex])
     end
end
