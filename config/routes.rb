Hotspot::Application.routes.draw do

get "/" => "home#index"
root :to => "home#index"
get "/auth/:provider/callback" => "sessions#create"
get "/signout" => "sessions#destroy", :as => :signout

end
