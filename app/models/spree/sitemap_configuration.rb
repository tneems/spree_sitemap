module Spree
  class SitemapConfiguration < Preferences::Configuration
    preference :include_product_groups,     :boolean, :default => true
    preference :include_product_taxonomies, :boolean, :default => true
    preference :static_pages, :string, :default => ""
  end
end