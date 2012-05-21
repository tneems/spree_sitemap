Spree::Core::Engine.routes.draw do
  resource :sitemap, :only => [:index]
end
