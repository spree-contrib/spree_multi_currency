# This migration comes from spree_i18n (originally 20150224152415)
class AddMultiCurrencyOptionsToPreferences < ActiveRecord::Migration
  def change
    add_column :spree_preferences, :allow_currency_change, :boolean
    add_column :spree_preferences, :show_currency_selector, :boolean
    add_column :spree_preferences, :supported_currencies, :string
  end
end
