Hotspot::Application.routes.draw do

  resources :access_requests

#Index
get "/" => "home#index"
root :to => "home#index"

#Sessions
get "/auth/:provider/callback" => "sessions#create"
get "/signout" => "sessions#destroy", :as => :signout

#User Administration
get "/users" => "administration#index", :as => 'users'
get "/users/:id/setrole/:role" => "administration#setrole", :as => 'set_role'

#Content Manager Dashboard
get "/my_hotspots" => "my_hotspots#dashboard", :as => 'dashboard'

#Access Request
get "/content_manager_application" => "access_requests#new", :as => "cm_application"
get "/approve_request/:id" => "access_requests#approve", :as => "approve_request"

end
