Deface::Override.new(:virtual_path => "spree/admin/configurations/index",
                     :name => "spree_sitmap_add_to_admin_menu",
                     :insert_after => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                     :text => "<%= configurations_menu_item(t(\"sitemap\"), admin_sitemap_path, t(\"sitemap_description\")) %>",
                     :disabled => false)
