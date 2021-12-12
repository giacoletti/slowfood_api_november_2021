RSpec.describe 'PUT /api/orders/:id', type: :request do
  subject { response }
  let(:product1) { create(:product, name: 'Pancakes') }
  let(:product2) { create(:product, name: 'Soup') }
  let!(:order) { create(:order) }
  let!(:order_item1) { create(:order_item, order: order, product: product1) }

  before do
    put "/api/orders/#{order.id}", params: { product_id: product2.id }
  end

  it { is_expected.to have_http_status :ok }

  it 'is expected to respond with a message when product is added' do
    expect(response_json['message']).to eq 'Soup has been added to your order'
  end

  describe 'params are missing when to update order' do

    before do
      put "/api/orders/#{order.id}", params: { product_id: product2.id }
    end
  
    it { is_expected.to have_http_status :unprocessable_entity }

    it 'is excepted to respond with a error message if product is not in database' do
    end
  end
end
