describe 'GET /api/products' do
  subject { response }
  let!(:product) { create(:product) }

  before do
    get '/api/products'
  end

  it 'is expected to respond with status 200' do
    expect(subject.status).to eq 200
  end

  it 'is expected to respond with a product name' do
    expect(response_json['products'].first['name']).to eq 'Pancakes'
  end

  it 'is expected to respond with a product price' do
    expect(response_json['products'].first['price']).to eq 25
  end
end
