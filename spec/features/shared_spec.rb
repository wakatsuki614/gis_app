require 'rails_helper'

RSpec.feature "Shared", type: :feature do
  feature "header" do
    context 'ユーザーがログインしていない場合' do
      background do
        visit root_path
      end

      scenario 'ログインをクリックするとログイン画面へ遷移する' do
        click_link "ログイン", match: :first
        expect(current_path).to eq login_path
      end

      scenario '新規会員登録をクリックすると新規会員登録ページへ遷移する' do
        click_link "新規会員登録", match: :first
        expect(current_path).to eq signup_path
      end
    end

    context 'ユーザーがログインしている場合' do
      given(:user) { create(:user) }

      background do
        visit login_path
        fill_in "session[email]", with: user.email
        fill_in "session[password]", with: user.password
        find(".login-test").click
        visit root_path
      end

      scenario 'スクール登録をクリックするとschools#newへ遷移する' do
        click_link "スクール登録", match: :first
        expect(current_path).to eq new_school_path
      end

      scenario '登録済スクールをクリックするとschools#indexへ遷移する' do
        click_link "登録済スクール", match: :first
        expect(current_path).to eq schools_path
      end

      scenario 'アカウント設定をクリックするとusers#editへ遷移する' do
        click_link "アカウント設定", match: :first
        expect(current_path).to eq edit_user_path(user)
      end
    end
  end
end
