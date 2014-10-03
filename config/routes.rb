Spree::Core::Engine.routes.draw do
  get "google_merchant" => 'google_merchant#index', :constraints => {:format => :rss}

  namespace :admin do
    resource :google_merchants
  end
end
