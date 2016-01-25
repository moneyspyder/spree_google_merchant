Deface::Override.new(
  virtual_path: 'spree/admin/shared/_product_tabs',
  name: 'google_feed_product_admin_tab',
  insert_bottom: '[data-hook="admin_product_tabs"]',
  partial: 'spree/admin/products/google_feed'
)