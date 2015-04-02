xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"

xml.rss 'version' => '2.0', 'xmlns:g' => 'http://base.google.com/ns/1.0' do
  xml.channel do
    xml.title Spree::GoogleMerchant::Config[:google_merchant_title]
    xml.description Spree::GoogleMerchant::Config[:google_merchant_description]

    production_domain = Spree::GoogleMerchant::Config[:production_domain]
    xml.link production_domain

    @products.each do |product|
      xml.item do
        xml.id product.id.to_s
        xml.title product.name
        xml.description product.description.strip_html_tags unless product.description.blank?
        xml.link product_url(product, host: production_domain)
        xml.tag! "g:mpn", product.sku.to_s
        xml.tag! "g:id", product.id.to_s
        if product.respond_to?(:on_sale?) && product.on_sale?
          xml.tag! "g:price", product.original_price
          xml.tag! "g:sale_price", product.price
        else
          xml.tag! "g:price", product.price
        end
        if.product.respond_to?(:google_merchant_category)
          xml.tag! "g:product_category", product.google_merchant_category
        else
          xml.tag! "g:product_category", "Health &amp; Beauty &gt; Personal Care &gt; Cosmetics &gt; Makeup"
        end
        if product.respond_to?(:google_merchant_type) 
          xml.tag! "g:product_type", product.google_merchant_type
        else
          xml.tag! "g:product_type", "Health &amp; Beauty &gt; Personal Care &gt; Cosmetics &gt; Makeup"
        end
        #xml.tag! "g:product_type", 
        xml.tag! "g:condition", 'new'
        xml.tag! "g:availability", product.master.can_supply? ? "in stock" : "out of stock"
        xml.tag! "g:image_link", product.images.first.attachment.url(:product) unless product.images.empty?
        (product.images[1..10] || []).each do |image|
          xml.tag! "g:additional_image_link", image.attachment.url(:product)
        end
        if product.property("brand").present?
          xml.tag! "g:brand", product.property("brand") if product.property("brand").present?
        else
          xml.tag! "g:brand", current_store.name
        end
        xml.tag! "g:gtin", product.property("gtin") if product.property("gtin").present?
        xml.tag! "g:tax" do
          xml.tag! "g:rate", "8.65"
          xml.tag! "g:tax_ship", "y"
        end
        xml.tag! "g:shipping" do
          if Spree::ShippingMethod.first.calculator.respond_to?(:compute_from_price) # we only care about price sack
            xml.tag! "g:price", Spree::ShippingMethod.first.calculator.compute_from_price(product.price).to_s
          else
            xml.tag! "g:price", "0"
          end
        end
      end
    end
  end
end
