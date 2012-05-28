Spree::ProductsController.class_eval do
  def google_merchant
    @products = Spree::Product.all
  end
end
