require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    visit signup_path
  end

  describe "GET /signup" do
    it '正しい情報を入力するとユーザー新規登録ができること' do
      fill_in "user[name]", with: "テストユーザー"
      fill_in "user[email]", with: "user@test.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      expect { click_button "登録する" }.to change { User.count }.by(1)
    end

    it '誤った情報ではユーザー新規登録ができないこと' do
      fill_in "user[name]", with: ""
      fill_in "user[email]", with: ""
      fill_in "user[password]", with: ""
      fill_in "user[password_confirmation]", with: ""
      expect { click_button "登録する" }.to change { User.count }.by(0)
    end
  end
end
