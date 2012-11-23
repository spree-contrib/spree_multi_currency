Spree::AppConfiguration.class_eval do
  preference :allow_currency_change, :boolean, :default => false
  preference :show_currency_selector, :boolean, :default => false
  preference :supported_currencies, :string, :default => 'USD'
end
