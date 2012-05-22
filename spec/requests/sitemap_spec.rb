require 'spec_helper'

describe "Visiting Products" do
  context "#index" do
    it "should include site_url" do
      visit "/sitemap.xml"
      page.should have_content(Spree::Config[:site_url])
    end

    context "products" do
      let!(:product) { FactoryGirl.create(:product) }
      let!(:deleted_product) { FactoryGirl.create(:product, :deleted_at => 1.day.ago) }
      let!(:future_product) { FactoryGirl.create(:product, :available_on => 1.day.from_now) }

      it "should include active products" do
        visit "/sitemap.xml"
        page.should have_content product.permalink
      end

      it "should not include deleted products" do
        visit "/sitemap.xml"
        page.should_not have_content deleted_product.permalink
      end

      it "should not include products that are not active yet" do
        visit "/sitemap.xml"
        page.should_not have_content future_product.permalink
      end
    end
    context "taxons" do
      let!(:taxon) { FactoryGirl.create(:taxon)}

      context "set false" do
        let!(:include_product_taxonomies) { Spree::Sitemap::Config.set :include_product_taxonomies => false }

        it "should not include taxons" do
          visit "/sitemap.xml"
          page.should_not have_content taxon.permalink
        end
      end

      context "set true" do
        let!(:include_product_taxonomies) { Spree::Sitemap::Config.set :include_product_taxonomies => true }

        it "should include taxons" do
          visit "/sitemap.xml"
          page.should have_content taxon.permalink
        end
      end
    end

    context "pgs" do
      let!(:pg) { FactoryGirl.create(:product_group)}

      context "set false" do
        let!(:include_product_groups) { Spree::Sitemap::Config.set :include_product_groups => false }

        it "should not include pgs" do
          visit "/sitemap.xml"
          page.should_not have_content pg.permalink
        end
      end

      context "set true" do
        let!(:include_product_groups) { Spree::Sitemap::Config.set :include_product_groups => true }

        it "should include pgs" do
          visit "/sitemap.xml"
          page.should have_content pg.permalink
        end
      end
    end

    xit "should include custom static pages" do
      visit "/sitemap.xml"
      page.should have_content "static_page"
    end
  end
end
