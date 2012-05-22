Spree::Core::Engine.routes.draw do
  get '/sitemap' => 'sitemap#index'

  namespace :admin do
    resource :sitemap
  end
end
