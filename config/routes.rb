Rails.application.routes.draw do
  get 'ojt_top/kanri'
  get 'ojt_top/user'

  devise_for :kanrisyas
  root 'menu#menu_top'
  devise_scope :social_account do
     get 'sign_out', to: "menu#menu_top"
  end

  get "menu/kanri"
  get "menu/user"
  get "menu/menu_top"

  get "kanri/kanri_top"
  get "kanri/sirabasu_make"
  get "kanri/check_make"
  get "kanri/sintyoku_all"
  get "kanri/sintyoku_user"
  get "kanri/user_make"

  resources :sirabasus
  get "sirabasus/show"

  get "kanrisyas/new"

  get "user/user_top"
  get "user/check_rist"
  get "user/sirabasu"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
