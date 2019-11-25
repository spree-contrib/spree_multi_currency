# frozen_string_literal: true

Deface::Override.new(
  virtual_path: 'spree/admin/shared/_product_tabs',
  name: 'add-prices-to-product-tabs',
  insert_bottom: 'ul[data-hook="admin_product_tabs"]',
  text: <<-HTML
          <li class="<%= 'active' if current == 'Prices' %>">
            <% title = Spree.t(:prices) %>
            <%= link_to_with_icon 'money', title, admin_product_prices_path(@product), title: title %>
          </li>
        HTML
)
