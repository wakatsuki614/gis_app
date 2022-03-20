require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  let(:user)   { create(:user) }

  before do
    visit login_path
  end

  describe "GET /login" do
    it 'ログインに成功するとトップページへ遷移する' do
      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password
      find(".login-test").click
      expect(current_path).to eq root_path
      expect(page).to have_content "ようこそ、#{user.name}さん！"
    end

    it 'ログインに失敗するとログイン画面が再度読み込まれる' do
      fill_in "session[email]", with: ""
      fill_in "session[password]", with: ""
      find(".login-test").click
      expect(current_path).to eq login_path
      expect(page).to have_content "ログインに失敗しました。"
    end
  end
end
