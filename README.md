Summary
=======

Provides a live product feed for Google Merchant rather a file that you have to upload.

Updated to work with Spree 2.3.

Sale prices are based on a difference between the lowest price and msrp. If the lowest price is lower than the msrp the product is on sale.

To access the configuration visit:

    http://yoursite.com/admin/google_merchants

To access the feed visit:

    http://yoursite.com/google_merchant.rss

Installation
------------

To start with you'll need a Google Merchant account. Then:
  
    gem "spree_google_merchant", github => 'deseretbook/spree_google_merchant', ref: '2-3-stable'
    
    bundle install
 
To configure the feed title, description and site URL go to the Google Merchant settings page in Admin -> Configuration

Copyright (c) 2011 sebastyuiop, released under the New BSD License
