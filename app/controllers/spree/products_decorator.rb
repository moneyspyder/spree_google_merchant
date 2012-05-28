class Spree::ProductsController < Spree::BaseController
  def google_merchant
    @products = Spree::Product.all
  end
end
