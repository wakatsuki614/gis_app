require 'rails_helper'

RSpec.describe "Schools", type: :request do
  let(:user)   { create(:user) }
  let(:school) { create(:school) }

  before do
    session_params = { session: { email: user.email, password: user.password } }
    post login_path, params: session_params
  end

  describe "GET /schools" do
    it 'リクエスト成功を表す200が返ってきたか確認' do
      get schools_path
      expect(response.status).to eq 200
    end
  end

  describe "GET /schools/:id" do
    it 'リクエスト成功を表す200が返ってきたか確認' do
      get school_path(school)
      expect(response.status).to eq 200
    end
  end

  describe "GET /schools/new" do
    it 'リクエスト成功を表す200が返ってきたか確認' do
      get new_school_path
      expect(response.status).to eq 200
    end
  end

  describe "GET /schools/:id/edit" do
    it 'リクエスト成功を表す200が返ってきたか確認' do
      get edit_school_path(school)
      expect(response.status).to eq 200
    end
  end
end
