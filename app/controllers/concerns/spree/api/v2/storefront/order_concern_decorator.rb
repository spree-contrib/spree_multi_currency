# Replaces currency in find_spree_current_order with actualy used currency
# frozen_string_literal: true

module OrderConcernDecorator
  private

  def find_spree_current_order
    Spree::Api::Dependencies.storefront_current_order_finder.constantize.new.execute(
      store: spree_current_store,
      user: spree_current_user,
      token: order_token,
      currency: use_current_currency
    )
  end

  def use_current_currency
    if session.key?(:currency) && supported_currencies.map(&:iso_code).include?(session[:currency])
      session[:currency]
    else
      Spree::Config[:currency]
    end
  end

  def supported_currencies
    Spree::Config[:supported_currencies].split(',').map do |code|
      ::Money::Currency.find(code.strip)
    end
  end
end

Spree::Api::V2::Storefront::OrderConcern.prepend OrderConcernDecorator
