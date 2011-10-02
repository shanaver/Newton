Newton::Application.routes.draw do
  devise_for :users

  resources :newts
  
  match '/users/:id/dashboard' => 'users#dashboard', :as => 'users_dashboard'

  match '/newt/:id.json' => 'newts#remote', :as => 'get_newton', :via => "get"

  match '/newts(/:id)(/:secret)/edit' => 'newts#edit', :as => 'edit_newton'
  match '/add_editor_field' => 'newts#add_editor_field', :as => 'add_editor_field'
  match '/newts(/:id)(/:secret)(/:editor)/remove_editor' => 'newts#remove_editor', :as => 'remove_editor'
  match '/scripts/newton' => 'javascripts#newton', :as => 'get_newton_script'
  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "newts#index"

end
