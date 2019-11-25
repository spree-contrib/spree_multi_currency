# frozen_string_literal: true

Deface::Override.new(
  virtual_path: 'spree/shared/_main_nav_bar',
  name: 'add-currency-selector-in-main-nav-bar',
  insert_bottom: '#main-nav-bar > .navbar-right',
  text: <<-HTML
          <% if Spree::Config[:allow_currency_change] && Spree::Config[:show_currency_selector] && supported_currencies.size > 1 %>
            <li id="currency-select" data-hook>
              <%= form_tag set_currency_path(format: :html), class: 'navbar-form' do %>
                <div class="form-group">
                  <label for="currency" class="sr-only"><%= Spree.t(:currency) %></label>
                  <%= select_tag(:currency, options_for_select(supported_currencies, current_currency), class: 'form-control', data: { href: set_currency_path(format: :json) }) %>
                  <noscript><%= submit_tag %></noscript>
                </div>
              <% end %>
            </li>
          <% end %>
        HTML
)
