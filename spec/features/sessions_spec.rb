require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  feature "GET /login" do
    scenario '新しいアカウントを作成をクリックすると新規会員登録ページへ遷移する' do
      visit login_path
      click_link "新しいアカウントを作成"
      expect(current_path).to eq signup_path
    end
  end
end
