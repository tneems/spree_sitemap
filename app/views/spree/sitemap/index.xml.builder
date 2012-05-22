base_url = "#{Spree::Config[:site_url]}"
base_url = base_url[0..-2] if base_url[-1] == "/"
xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"

xml.urlset :xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc base_url
    xml.lastmod Date.today.xmlschema
    xml.changefreq 'daily'
    xml.priority '1.0'
  end
  Spree::Product.active.each do |product|
    xml.url do
      xml.loc "#{base_url}#{product_path(product)}"
      xml.lastmod product.updated_at.xmlschema
      xml.changefreq 'weekly'
      xml.priority '0.8'
    end
  end
  if Spree::Sitemap::Config[:include_product_taxonomies] == true
    Spree::Taxon.all.each do |taxon|
      xml.url do
        xml.loc "#{base_url}/t/#{taxon.permalink}"
        xml.lastmod taxon.updated_at.xmlschema
        xml.changefreq 'weekly'
        xml.priority '0.8'
      end
    end
  end
  if Spree::Sitemap::Config[:include_product_groups] == true
    Spree::ProductGroup.all.each do |pg|
      xml.url do
        xml.loc "#{base_url}/pg/#{pg.permalink}"
        xml.lastmod pg.products.present? ? pg.products.map(&:updated_at).sort.last.xmlschema : Date.today.xmlschema
        xml.changefreq 'weekly'
        xml.priority '0.8'
      end
    end
  end
  if Spree::Sitemap::Config[:static_pages].present?
    Spree::Sitemap::Config[:static_pages].gsub(/\s/,'').split(',').each do |page|
      xml.url do
        xml.loc "#{base_url}/#{page}"
        xml.lastmod Date.today.xmlschema
        xml.changefreq 'weekly'
        xml.priority '0.8'
      end
    end
  end
end
