require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:subject) { create(:user) }

  it { is_expected.to have_many(:orders) }
  it { is_expected.to validate_inclusion_of(:role).in_array(User::ROLES) }
  it { expect(subject.role).to eql('buyer') }
end
