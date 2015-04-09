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

Add to your `Gemfile`
```ruby
gem 'spree_multi_currency', github: 'spree-contrib/spree_multi_currency', branch: '3-0-stable'
```

Run
```
bundle && bundle exec rails g spree_multi_currency:install
```

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
