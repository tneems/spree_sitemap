require 'spec_helper'

describe Spree::SitemapController do
  context "#index" do
    it "should render" do
      get :index, :use_route => :spree
      response.body.should match /Tests/
    end
  end
end