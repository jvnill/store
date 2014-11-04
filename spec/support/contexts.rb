RSpec.shared_context 'admin logged in' do
  let!(:admin) { create(:user, role: 'admin') }

  before { sign_in_as(admin) }
end
