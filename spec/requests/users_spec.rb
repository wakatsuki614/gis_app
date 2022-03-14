require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }

  before do
    session_params = { session: { email: user.email, password: user.password } }
    post login_path, params: session_params
  end

  describe "GET /signup" do
    it 'リクエスト成功を表す200が返ってきたか確認' do
      get signup_path
      expect(response.status).to eq 200
    end
  end

  describe "GET /users/:id/edit" do
    it 'リクエスト成功を表す200が返ってきたか確認' do
      get edit_user_path(user)
      expect(response.status).to eq 200
    end
  end
end
