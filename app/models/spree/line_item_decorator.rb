# frozen_string_literal: true
Spree::LineItem.class_eval do
  def update_price
    currency_price = Spree::Price.where(
      currency: order.currency,
      variant_id: variant_id
    ).first

    self.price = currency_price.price_including_vat_for(tax_zone: tax_zone)
  end
end
