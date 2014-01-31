module Spree
  class CurrencyController < Spree::StoreController

    def set
      @currency = supported_currencies.find { |currency| currency.iso_code == params[:currency] }
      # make shure that we update the current order, so the currency change is reflected
      if current_order
        update_order!
      end
      session[:currency] = params[:currency] if Spree::Config[:allow_currency_change]
      respond_to do |format|
        format.json { render json: !@currency.nil? }
        format.html do
          # We want to go back to where we came from!
          redirect_back_or_default(root_path)
        end
      end
    end

    private

    # Updates the order's prices and all line items prices
    def update_order!
      @order = current_order
      if update_line_items!
        @order.update_attributes!(currency: @currency.iso_code)
        @order.update!
      end
    end

    # Updates prices of order's line items
    def update_line_items!
      return unless @order.line_items.any?
      @order.line_items.each do |line_item|
        update_line_item_price!(line_item)
      end
    end

    # Returns the price object from given item
    def price_from_line_item(line_item)
      return unless line_item.variant
      line_item.variant.prices.detect { |p| p.currency == @currency.iso_code }
    end

    # Updates price from given line item
    def update_line_item_price!(line_item)
      price = price_from_line_item(line_item)
      if price
        # Mass Assignment Protection \o/
        line_item.currency = price.currency
        line_item.price = price.amount
        line_item.save!
      end
    end

  end
end
