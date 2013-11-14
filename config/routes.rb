LcboApp::Application.routes.draw do
  root to: "products#index"
  post "products" => "products#index", :as => "list_products"

  resources :products, :only => [:index, :show]
end
