# frozen_string_literal: true

RSpec.describe 'POST /api/comments', type: :request do
  describe 'with valid credentials' do
    let!(:user) { create(:user) }
    let(:credentials) { user.create_new_auth_token }
    let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }
    let!(:article) { create(:article) }

    describe 'User can comment on article' do
      before do
        post '/api/comments', params: { body: 'Comment string', user_id: user.id, article_id: article.id },
                              headers: headers
      end
      it 'returns a 200 response' do
        expect(response).to have_http_status 200
      end
    end
  end
end
