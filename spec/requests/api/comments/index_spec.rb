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
  describe 'unsuccessfully when there is no comment' do
    before do
      get '/api/comments', params: { article_id: article_with_no_comment.id }
    end
    it 'returns a 404 error' do
      expect(response).to have_http_status 404
    end
    it 'returns 0 comments' do
      expect(response_json['message']).to eq 'No comments to show'
    end
  end

  describe 'unsuccessfully when there is no article' do
    before do
      get '/api/comments', params: { article_id: 999 }
    end
    it 'returns a 404 error' do
      expect(response).to have_http_status 404
    end
    it 'returns 0 comments' do
      expect(response_json['message']).to eq 'Article with id 999 could not be found'
    end
  end
end
