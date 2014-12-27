RSpec.describe Spree::Product, type: :model do
  it 'aliases :price= to :amount=' do
    expect(subject).to respond_to :amount=
  end
end
