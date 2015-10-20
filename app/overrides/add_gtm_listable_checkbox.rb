Deface::Override.new(virtual_path: 'spree/admin/products/_form',
                     name: 'gtm_listing',
                     insert_after: "[data-hook='admin_product_form_right'], #admin_product_form_right[data-hook]",
                     partial: 'spree/admin/google_merchants/gtm_listable_checkbox',
                     disabled: false)
