require 'spec_helper'

describe "Product with prices in multiple currencies" do

  context "with USD,EUR and GBP as currencies" do
    let!(:product) {create(:product)}

    before do
      reset_spree_preferences do |config|
        config.supported_currencies = "USD,EUR,GBP"
        config.allow_currency_change = true
        config.show_currency_selector = true
      end
      create(:price, variant: product.master, currency: 'EUR', amount: 16.00)
      create(:price, variant: product.master, currency: 'GBP', amount: 23.00)
    end

    it "can switch by currency", :js => true do
      visit spree.product_path(product)
      expect(page).to have_content("$19.99")
      select "EUR",:from => "currency"
      expect(page).to have_content("€16.00")
      select "GBP",:from => "currency"
      expect(page).to have_content("£23.00")
    end

    context "and show_currency_selector is false" do
      before do
        reset_spree_preferences do |config|
          config.supported_currencies = "USD,EUR,GBP"
          config.allow_currency_change = true
          config.show_currency_selector = false
        end
      end

      it "will not render the currency select" do
        visit spree.product_path(product)
        expect(page).to_not have_content "Currency"
      end
    end

  end
end