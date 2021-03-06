require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:subject) { create(:product) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
end
