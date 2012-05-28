Spree::ProductsController.class_eval do
  def google_merchant
    @products = Spree::Product.active

    respond_to do |format|
      format.rss { render :layout => false }
    end

  end
end
