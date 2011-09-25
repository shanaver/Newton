Newton::Application.routes.draw do
  devise_for :users

  resources :newts

  match '/newts(/:id)(/:secret)/edit' => 'newts#edit', :as => 'edit_newton'
  match '/newt/:id.json' => 'newts#remote', :as => 'get_newton'
  match '/scripts/newton' => 'javascripts#newton', :as => 'get_newton_script'
  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "newts#index"

end
