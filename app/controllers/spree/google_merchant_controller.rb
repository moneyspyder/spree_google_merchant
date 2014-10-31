module Spree
  class GoogleMerchantController < Spree::BaseController
    respond_to :rss

    def index
      @products = Spree::Product.active.includes(:master => [:images])
      respond_with @products do |format|
        format.rss { render :layout => false }
      end
    end
  end
end
