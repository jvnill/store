require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  include_context 'admin logged in'

  describe 'GET index' do
    let!(:product) { create(:product) }

    before { get :index }

    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
    it { expect(assigns(:products)).to match_array([product]) }
  end

  describe 'GET new' do
    before { get :new }

    it { expect(response).to be_success }
    it { expect(response).to render_template(:new) }
    it { expect(assigns(:product)).to be_new_record }
  end

  describe 'POST create' do
    context 'valid product' do
      before { post :create, product: { name: 'P', description: 'D', price: 1 } }

      it { expect(response).to redirect_to(assigns(:product)) }
      it { expect(assigns(:product)).to be_persisted }
    end

    context 'invalid product' do
      before { post :create, product: { name: '', description: 'D', price: 1 } }

      it { expect(response).to be_success }
      it { expect(response).to render_template(:new) }
      it { expect(assigns(:product).errors.to_a).to match_array(['Name can\'t be blank']) }
    end
  end

  describe 'GET show' do
    let!(:product) { create(:product) }

    before { get :show, id: product.id }

    it { expect(response).to be_success }
    it { expect(response).to render_template(:show) }
    it { expect(assigns(:product)).to eql(product) }
  end

  describe 'GET edit' do
    let!(:product) { create(:product) }

    before { get :edit, id: product.id }

    it { expect(response).to be_success }
    it { expect(response).to render_template(:edit) }
    it { expect(assigns(:product)).to eql(product) }
  end

  describe 'PATCH update' do
    let!(:product) { create(:product) }

    context 'valid update' do
      before { patch :update, id: product.id, product: { name: 'PPP' } }

      it { expect(response).to redirect_to(product) }
      it { expect(product.reload.name).to eql('PPP') }
    end

    context 'invalid update' do
      before { patch :update, id: product.id, product: { name: '' } }

      it { expect(response).to be_success }
      it { expect(response).to render_template(:edit) }
      it { expect(assigns(:product).errors.to_a).to match_array(['Name can\'t be blank']) }
    end
  end

  describe 'DELETE destroy' do
    let!(:product) { create(:product) }

    before { xhr :delete, :destroy, id: product.id }

    it { expect(response).to be_success }
    it { expect(response).to render_template(:destroy) }
    it { expect { product.reload }.to raise_error(ActiveRecord::RecordNotFound) }
  end
end
