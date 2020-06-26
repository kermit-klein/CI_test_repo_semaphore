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
      it 'returns success message' do
        expect(response_json['message']).to eq 'Success! Your comment is posted'
      end
    end

    describe 'User can not comment when body is blank' do
      before do
        post '/api/comments', params: { user_id: user.id, article_id: article.id },
                              headers: headers
      end
      it 'returns a 400 response' do
        expect(response).to have_http_status 400
      end
      it 'returns success message' do
        expect(response_json['message']).to eq 'Body cant be blank'
      end
    end

    describe 'Visitor cant create comment' do
      let!(:article) { create :article }
      let(:headers_with_no_user) { { HTTP_ACCEPT: 'application/json' } }
      before do
        post '/api/comments',
             params: {
               body: 'Comment string', article_id: article.id
             }, headers: headers_with_no_user
      end

      it 'returns a 401 response' do
        expect(response).to have_http_status 401
      end

      it 'returns error message' do
        expect(response_json['errors']).to eq ['You need to sign in or sign up before continuing.']
      end
    end

    describe 'User cant post a comment without article_id parameter' do
      before do
        post '/api/comments', params: { body: 'Comment string', user_id: user.id },
                              headers: headers
      end
      it 'returns a 400 response' do
        expect(response).to have_http_status 400
      end
      it 'returns error message' do
        expect(response_json['message']).to eq 'Cant do that'
      end
    end
  end
end
