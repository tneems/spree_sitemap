module Spree
  class SitemapController < BaseController
    def index
      # render :text => "Test"
      respond_to do |format|
        format.xml {  }
      end
    end
  end
end
