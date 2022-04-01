require 'rails_helper'

RSpec.describe "Reviews", type: :system do
  let(:user) { create(:user) }
  let(:school) { create(:school) }

  describe "GET /schools/:id" do
    before do
      visit login_path
      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password
      find(".login-test").click
      visit school_path(school)
    end

    it 'コメントが投稿できること' do
      fill_in "review[body]", with: "こんにちは"
      expect { click_button "投稿" }.to change { Review.count }.by(1)
      expect(page).to have_content "こんにちは"
    end

    it 'コメントが空白では投稿できないこと' do
      fill_in "review[body]", with: ""
      expect { click_button "投稿" }.to change { Review.count }.by(0)
    end
  end
end
