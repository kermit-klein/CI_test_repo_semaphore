RSpec.describe 'GET /api/articles/:id', type: :request do
  let!(:article) { create(:article) }
  describe 'successfully' do
    before do
      get "/api/articles/#{article.id}"
    end

    it 'returns a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'returns correct article' do
      expect(response_json['article']['id']).to eq article.id
    end
  end
end