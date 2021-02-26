# ⚠️ Deprecation notice ⚠️
Since [Spree 4.2](https://guides.spreecommerce.org/release_notes/4_2_0.html) this extension is deprecated and not needed. Multi Currency was merged into Spree core.

# Spree Multi-Currency

[![Build Status](https://travis-ci.org/spree-contrib/spree_multi_currency.svg?branch=master)](https://travis-ci.org/spree-contrib/spree_multi_currency)
[![Code Climate](https://codeclimate.com/github/spree-contrib/spree_multi_currency/badges/gpa.svg)](https://codeclimate.com/github/spree-contrib/spree_multi_currency)

Provides UI to allow configuring multiple currencies in Spree.

This provides 3 preferences:

* allow_currency_change - Allow the users to change their currency via the currency set action.
* show_currency_selector - Display the currency selector in the main nav bar.  This will only display if there are multiple supported currencies, and allow_currency_change is on.
* supported_currencies - A comma separated list of

---

## Installation

1. Add this extension to your Gemfile with this line:

  #### Spree >= 3.1

  ```ruby
  gem 'spree_multi_currency', github: 'spree-contrib/spree_multi_currency'
  ```

  #### Spree 3.0 and Spree 2.x

  ```ruby
  gem 'spree_multi_currency', github: 'spree-contrib/spree_multi_currency', branch: 'X-X-stable'
  ```

  The `branch` option is important: it must match the version of Spree you're using.
  For example, use `3-0-stable` if you're using Spree `3-0-stable` or any `3.0.x` version.

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations
  ```ruby
  bundle exec rails g spree_multi_currency:install
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.

---

## Contributing

See corresponding [guidelines][1]

---

## License

Copyright (c) 2007-2015 [Gregor MacDougall][5], [Spree Commerce][2], and other [contributors][3], released under the [New BSD License][4]

[1]: https://github.com/spree-contrib/spree_multi_currency/blob/master/CONTRIBUTING.md
[2]: https://github.com/spree
[3]: https://github.com/spree-contrib/spree_multi_currency/contributors
[4]: https://github.com/spree-contrib/spree_multi_currency/blob/master/LICENSE.md
[5]: https://github.com/freerunningtech
