Spree::Product.class_eval do
  alias amount= price=
end
