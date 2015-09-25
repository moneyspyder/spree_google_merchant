xml.instruct! :xml, :version => "1.0", :encoding => "UTF-8"

xml.rss 'version' => '2.0', 'xmlns:g' => 'http://base.google.com/ns/1.0' do
  xml.channel do
    xml.title Spree::GoogleMerchant::Config[:google_merchant_title]
    xml.description Spree::GoogleMerchant::Config[:google_merchant_description]

    production_domain = Spree::GoogleMerchant::Config[:production_domain]
    xml.link production_domain

    @products.each do |product|
      presentation_color = product.option_types.where(presentation: 'Color').first

      if presentation_color
        presentation_color.option_values.each do |color|
          xml << render(partial: 'spree/google_merchant/product', locals: {builder: xml,
                                                                    production_domain: production_domain,
                                                                    product: product,
                                                                    color: color.presentation})
        end
      else
        xml << render(partial: 'spree/google_merchant/product', locals: {builder: xml,
                                                                  production_domain: production_domain,
                                                                  product: product,
                                                                  color: nil})
      end
    end
  end
end
