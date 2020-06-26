# frozen_string_literal: true

RSpec.describe 'GET /api/comments', type: :request do
  let!(:article) { create(:article) }
  let!(:article_with_no_comment) { create(:article) }
  let!(:comments) { 5.times { create(:comment, article: article) } }
  describe 'successfully' do
    before do
      get '/api/comments', params: { article_id: article.id }
    end

    it 'returns a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'returns 5 comments' do
      expect(response_json['comments'].count).to eq 5
    end
  end
end
