require 'rails_helper'

RSpec.feature "Users", type: :feature do
  feature "GET /signup" do
    scenario 'すでにアカウントをお持ちの方はログインをクリックするとログイン画面へ遷移する' do
      visit signup_path
      click_link "すでにアカウントをお持ちの方はログイン"
      expect(current_path).to eq login_path
    end
  end
end
