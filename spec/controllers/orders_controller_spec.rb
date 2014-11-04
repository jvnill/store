require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  include_context 'buyer logged in'

  describe 'PATCH add' do
    let!(:product) { create(:product) }
    let!(:order)   { create(:order, user: buyer) }

    before { xhr :patch, :add, product_id: product.id }

    it { expect(response).to be_success }
    it { expect(response).to render_template(:add) }
    it { expect(order.order_items.first.product).to eql(product) }
  end

  describe 'POST checkout' do
    let!(:product)    { create(:product) }
    let!(:order)      { create(:order, user: buyer) }
    let!(:order_item) { create(:order_item, order: order, product: product) }

    before { post :checkout }

    it { expect(response).to be_redirect }
    it { expect(order.reload.status).to eql('pending') }
  end

  describe 'POST mark_paid' do
    context 'transaction is not verified' do
      before do
        allow(HTTParty).to receive(:post).and_return(double(success?: false))

        post :mark_paid
      end

      it { expect(response.body).to eql('Invalid request') }
      it { expect(response.status).to eql(403) }
    end

    context 'transaction is verified' do
      let!(:order) { create(:order, user: buyer) }

      before do
        allow(HTTParty).to receive(:post).and_return(double(success?: true))

        post :mark_paid, order_id: order.id, reference: 'ref'
      end

      it { expect(response).to be_success }
      it { expect(response).to render_template(:mark_paid) }
      it { expect(order.reload.status).to eql('paid') }
      it { expect(order.reload.reference_number).to eql('ref') }
    end
  end
end
