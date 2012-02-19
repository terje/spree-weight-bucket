Weight Bucket Shipping Calculator for Spree
=================

A shipping calculator for [Spree](http://spreecommerce.com) that
calculates shipping costs based on weight buckets. Ranges of package
weights are assigned a price and the shipping cost worked out based on
the total weight of the products in the cart.

Installation
=======

Add this line to your _Gemfile_:

    gem "spree_weight_bucket", :git => "git@github.com:terje/spree-weight-bucket.git"


Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for
the specs to run against.

    $ bundle
    $ bundle exec rake test app
    $ bundle exec rspec spec

Copyright (c) 2012 Terje Tjervaag, released under the New BSD License
