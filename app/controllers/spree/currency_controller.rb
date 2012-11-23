module Spree
  class CurrencyController < Spree::StoreController
    def set
      currency = supported_currencies.find { |currency| currency.iso_code == params[:currency] }
      session[:currency] = params[:currency] if Spree::Config[:allow_currency_change]
      respond_to do |format|
        format.json { render :json => !currency.nil? }
        format.html do
          redirect_to root_path
        end
      end
    end
  end
end
