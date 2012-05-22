module Spree
  class Admin::SitemapsController < Admin::BaseController
    def update
      Spree::Sitemap::Config.preferences.keys.each do |key|
        Spree::Sitemap::Config.set(key, params[key]) if params[key].present?
      end

      respond_to do |format|
        format.html {
          redirect_to admin_sitemap_path
        }
      end
    end
  end
end
