class AddIncludeInGoogleProductFeedToVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :include_in_google_product_feed, :boolean, default: true
  end
end
