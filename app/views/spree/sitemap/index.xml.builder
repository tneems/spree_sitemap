xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"

xml.urlset :xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc Spree::Sitemap::Config[:url]
    xml.lastmod Date.today
    xml.changefreq 'daily'
    xml.priority '1.0'
  end
  
end