# coding: utf-8

feature 'Product with prices in multiple currencies', :js do
  context 'with USD, EUR and GBP as currencies' do
    let!(:product) { create(:product) }

    background do
      reset_spree_preferences do |config|
        config.supported_currencies = 'USD,EUR,GBP'
        config.allow_currency_change = true
        config.show_currency_selector = true
      end
      create(:price, variant: product.master, currency: 'EUR', amount: 16.00)
      create(:price, variant: product.master, currency: 'GBP', amount: 23.00)
    end

    scenario 'can switch by currency' do
      visit spree.product_path(product)
      expect(page).to have_content('$19.99')
      select 'EUR', from: 'currency'
      expect(page).to have_content('€16.00')
      select 'GBP', from: 'currency'
      expect(page).to have_content('£23.00')
    end

    context 'and show_currency_selector is false' do
      background do
        reset_spree_preferences do |config|
          config.supported_currencies = 'USD,EUR,GBP'
          config.allow_currency_change = true
          config.show_currency_selector = false
        end
      end

      scenario 'will not render the currency selector' do
        visit spree.product_path(product)
        expect(page).to_not have_content 'Currency'
      end
    end

    context 'and allow_currency_change is false' do
      context 'and show_currency_selector is true' do
        background do
          reset_spree_preferences do |config|
            config.supported_currencies = 'USD,EUR,GBP'
            config.allow_currency_change = false
            config.show_currency_selector = true
          end
        end

        scenario 'will not render the currency selector' do
          visit spree.product_path(product)
          expect(page).to_not have_content 'Currency'
        end
      end
    end
  end
end
