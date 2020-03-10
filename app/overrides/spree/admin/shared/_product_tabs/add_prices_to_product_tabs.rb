# frozen_string_literal: true

Deface::Override.new(
  virtual_path: 'spree/admin/shared/_product_tabs',
  name: 'add-prices-to-product-tabs',
  insert_bottom: '[data-hook="admin_product_tabs"]',
  partial: 'spree/admin/prices/prices_link'
)
