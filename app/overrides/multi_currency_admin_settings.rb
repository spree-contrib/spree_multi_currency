# frozen_string_literal: true

Deface::Override.new(
  virtual_path: 'spree/admin/general_settings/edit',
  name: 'multiple-currency',
  insert_after: Spree.version.to_f < 3.5 ? '.panel.currency' : '.form-group',
  partial: 'spree/admin/general_settings/form',
  disabled: false
)
