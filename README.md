Summary
=======

Provides a live product feed for Google Merchant rather a file that you have to upload. This is a very basic extension so feel free to help improve it!

To access the feed visit:

    http://yoursite.com/google_merchant.rss

Installation
------------

To start with you'll need a Google Merchant account. Then:

    gem "spree_google_merchant", github: 'swalberg/spree_google_merchant', branch: '2-1-stable'

    bundle install

 
To configure the feed title, description and site URL go to the Google Merchant settings page in Admin -> Configuration

Copyright (c) 2011 sebastyuiop, released under the New BSD License
