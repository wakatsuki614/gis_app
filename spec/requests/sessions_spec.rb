require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /login" do
    it 'リクエスト成功を表す200が返ってきたか確認' do
      get login_path
      expect(response.status).to eq 200
    end
  end
end
