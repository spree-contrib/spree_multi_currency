module Spree
  Product.class_eval do
    alias_method :amount=, :price=
  end
end
