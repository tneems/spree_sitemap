require 'spec_helper'

describe Spree::SitemapController do
  let!(:product) { FactoryGirl.create(:product) }

  context "#index" do
    it "should render index" do
      get :index, :format => :xml, :use_route => :spree
      response.body.should_not match "/"
    end

    it "should render products" do
      get :index, :format => :xml, :use_route => :spree
      response.body.should match product.permalink
    end

    context "taxons" do
      let!(:taxon) { FactoryGirl.create(:taxon)}

      context "set false" do
        before(:each) do
          Spree::Sitemap::Config.set :include_product_taxonomies => false
        end

        it "should not render taxons" do
          get :index, :format => :xml, :use_route => :spree
          response.body.should_not match taxon.permalink
        end
      end

      context "set true" do
        before(:each) do
          Spree::Sitemap::Config.set :include_product_taxonomies => true
        end

        it "should render taxons" do
          get :index, :format => :xml, :use_route => :spree
          response.body.should match taxon.permalink
        end
      end
    end

    context "pgs" do
      let!(:pg) { FactoryGirl.create(:product_group)}

      context "set false" do
        before(:each) do
          Spree::Sitemap::Config.set :include_product_groups => false
        end

        it "should not render pgs" do
          get :index, :format => :xml, :use_route => :spree
          response.body.should_not match pg.permalink
        end
      end

      context "set true" do
        before(:each) do
          Spree::Sitemap::Config.set :include_product_groups => true
        end

        it "should render pgs" do
          get :index, :format => :xml, :use_route => :spree
          response.body.should match pg.permalink
        end
      end
    end

    xit "should render custom static pages" do
      get :index, :format => :xml, :use_route => :spree
      response.body.should match "static_page"
    end
  end
end