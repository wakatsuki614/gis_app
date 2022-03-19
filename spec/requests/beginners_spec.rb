require 'rails_helper'

RSpec.describe "Beginners", type: :request do
  describe "GET /beginners" do
    it 'リクエスト成功を表す200が返ってきたか確認' do
      get beginners_path
      expect(response.status).to eq 200
    end
  end
end
