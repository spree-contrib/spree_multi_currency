Spree::Core::ControllerHelpers::Common.class_eval do
  def current_currency
    session[:currency] || Spree::Config[:currency]
  end
end
