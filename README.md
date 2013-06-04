SpreeMultiCurrency
==================

Provides UI to allow configuring multiple currencies in Spree.

NOTE: This extension is intended to be used with Spree 1.3 only.  It will not function with Spree 1.2 and below.

This provides 3 preferences:

* allow_currency_change - Allow the users to change their currency via the currency set action.
* show_currency_selector - Display the currency selector in the main nav bar.  This will only display if there are multiple supported currencies, and allow_currency_change is on.
* supported_currencies - A comma separated list of 

Example
=======

To install you'll need to add the following to your Gemfile:

```ruby
gem 'spree_multi_currency', :github => "spree/spree_multi_currency"
```


Run:

    $ bundle install


And then run:

    $ rails generate spree_multi_currency:install


TODO
====

* The price range filters don't work properly for the non-default currency.
* Style the currency selector to look better
* Improve the currency selector with something like select2.


Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec
