require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let!(:subject) { create(:order_item) }

  it { is_expected.to belong_to(:order) }
  it { is_expected.to belong_to(:product) }
end
