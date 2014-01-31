Hotspot::Application.routes.draw do

#Index
get "/" => "home#index"
root :to => "home#index"

#Sessions
get "/auth/:provider/callback" => "sessions#create"
get "/signout" => "sessions#destroy", :as => :signout

#User Administration
get "/users" => "administration#index"
get "/users/:id/setrole/:role" => "administration#setrole"

end
