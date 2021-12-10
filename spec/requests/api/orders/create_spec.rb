# use that namespace
# Restful use the name of the resource you're dealing with in the path
RSpec.describe "POST /api/orders" do
subject { response }
before do
 post '/api/orders', params: { order: { product_id: 1, user_id: 1 } }
end

it { is_expected.to have_http_status :created }
end
