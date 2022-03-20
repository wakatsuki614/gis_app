require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe "GET /signup" do
    before do
      visit signup_path
    end

    it '正しい情報を入力すると新規会員登録ができること' do
      fill_in "user[name]", with: "テストユーザー"
      fill_in "user[email]", with: "user@test.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      expect { click_button "登録する" }.to change { User.count }.by(1)
    end

    it '誤った情報では新規会員登録ができないこと' do
      fill_in "user[name]", with: ""
      fill_in "user[email]", with: ""
      fill_in "user[password]", with: ""
      fill_in "user[password_confirmation]", with: ""
      expect { click_button "登録する" }.to change { User.count }.by(0)
    end
  end

  describe "GET /users/:id/edit" do
    let(:user) { create(:user) }

    it '会員退会処理されること' do
      visit login_path
      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password
      find(".login-test").click
      visit edit_user_path(user)
      expect { click_on "退会する" }.to change { User.count }.by(-1)
    end
  end
end
