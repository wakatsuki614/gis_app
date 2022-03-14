require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /" do
    it 'リクエスト成功を表す200が返ってきたか確認' do
      get root_path
      expect(response.status).to eq 200
    end
  end
end
