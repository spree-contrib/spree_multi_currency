# frozen_string_literal: true
describe Spree::LineItem do
  describe "update_price" do
    let(:price)     { double "price" }
    let(:order)     { create :order, currency: "EUR" }
    let(:line_item) { create :line_item, order_id: order.id, currency: "EUR" }

    before do
      expect(line_item).to receive(:variant_id).and_return(1001)

      expect(Spree::Price).to receive(:where).with(
        currency: "EUR",
        variant_id: 1001
      ).and_return([price])

      expect(price).to receive(:price_including_vat_for).and_return(12)
    end

    it do
      line_item.price = 10
      line_item.update_price
      expect(line_item.price).to eq(12)
    end
  end
end
