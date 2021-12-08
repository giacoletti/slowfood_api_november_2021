describe 'GET /api/products' do
  subject { response }
  let!(:product) { create(:product, name: 'Foo', price: 1.5) }

  before do
    get '/api/products'
  end

  it 'is expected to respond with status 200' do
    expect(subject.status).to eq 200
  end

  it 'is expected to respond with an article' do
    expect(response_json['products'].first['name']).to eq 'Foo'
  end
end
