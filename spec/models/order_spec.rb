require 'rails_helper'

RSpec.describe Order, type: :model do
  let!(:subject) { create(:order) }

  it { is_expected.to have_many(:order_items) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_inclusion_of(:status).in_array(Order::STATUSES) }
  it { expect(subject.status).to eql('draft') }

  describe '#total' do
    let!(:product) { create(:product, price: 100) }

    context 'draft orders' do
      let!(:order)      { create(:order) }
      let!(:order_item) { create(:order_item, order: order, product: product, quantity: 2) }

      it { expect(order.total).to eql(200) }
    end

    context 'non draft orders' do
      let!(:order)      { create(:order, status: 'paid') }
      let!(:order_item) { create(:order_item, order: order, product: product, quantity: 2, price: 50) }

      it { expect(order.total).to eql(100) }
    end
  end
end
