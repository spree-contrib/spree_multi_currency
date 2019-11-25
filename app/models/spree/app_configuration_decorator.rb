module Spree
  module AppConfigurationDecorator
    def self.prepended(base)
      base.preference :allow_currency_change,  :boolean, default: false
      base.preference :show_currency_selector, :boolean, default: false
      base.preference :supported_currencies,   :string,  default: 'USD'
    end
  end
end

::Spree::AppConfiguration.prepend(Spree::AppConfigurationDecorator)
