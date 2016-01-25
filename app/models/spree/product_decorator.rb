Spree::Product.class_eval do
  # has_attached_file :feed_image, styles: lambda{|y| Spree::Image.attachment_definitions[:attachment][:styles]}
  # validates_attachment_content_type :feed_image, :content_type => /image/
end