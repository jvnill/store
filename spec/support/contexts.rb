RSpec.shared_context 'admin logged in' do
  let!(:admin) { create(:user, role: 'admin') }

  before { sign_in_as(admin) }
end

RSpec.shared_context 'buyer logged in' do
  let!(:buyer) { create(:user, role: 'buyer') }

  before { sign_in_as(buyer) }
end
