Spree::Core::Engine.routes.prepend do
  resource :sitemap, :only => [:index]
end
