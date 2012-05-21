require 'spree/core'

module Spree
  module Sitemap
    def self.config(&block)
      yield(Spree::Sitemap::Config)
    end
  end
end

require 'spree/sitemap/engine'