RSpec.describe 'POST /api/orders', type: :request do
  let!(:user) { create(:user) }
  let(:product) { create(:product) }
  subject { response }
  before do
    post '/api/orders', params: {
      order:
       { product_id: 1, user_id: user.id }
    }
    @order = Order.last
  end

  it { is_expected.to have_http_status :created }

  it 'is expected to create an instance of Order' do
    expect(@order).to_not eq nil
  end

  it 'is expected to associate order with user' do
    expect(@order.user).to eq user
  end
end
