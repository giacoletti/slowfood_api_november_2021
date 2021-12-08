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
    response_body = JSON.parse(response.body)
    expect(response_body['products'].first['name']).to eq 'Foo'
  end
end
