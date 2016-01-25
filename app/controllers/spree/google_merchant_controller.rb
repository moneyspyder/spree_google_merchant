module Spree
  class GoogleMerchantController < Spree::BaseController
    respond_to :rss

    def index
      @products = Spree::Variant.where(include_in_google_product_feed: true)
                      #.includes(:master => [:images])

      respond_with(@products)
    end
  end
end
