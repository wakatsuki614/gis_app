require 'rails_helper'

RSpec.feature "Reviews", type: :feature do
  given!(:user)  { create(:user) }
  given(:school) { create(:school) }

  feature "GET /schools/:id" do
    context 'ユーザーがログインしていない場合' do
      scenario '会員登録をクリックすると新規会員登録ページへ遷移する' do
        visit school_path(school)
        click_link "会員登録"
        expect(current_path).to eq signup_path
      end
    end

    context 'ユーザーがログインしている場合' do
      scenario 'ユーザー名表示テスト' do
        visit login_path
        fill_in "session[email]", with: user.email
        fill_in "session[password]", with: user.password
        find(".login-test").click
        visit school_path(school)
        expect(page).to have_content user.name
      end
    end
  end
end
