require 'rails_helper'

RSpec.describe "Reviews", type: :system do
  let!(:user) { create(:user) }
  let(:school) { create(:school) }

  before do
    visit login_path
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    find(".login-test").click
    visit school_path(school)
  end

  describe "コメント機能" do
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

  describe "いいね（参考になった）機能" do
    before do
      fill_in "review[body]", with: "こんにちは"
      click_button "投稿"
      click_link "ログアウト", match: :first
      visit school_path(school)
    end

    it '参考になったボタンを押すと、Likeモデルのカウントが１上がる' do
      expect(page).not_to have_content "1人"
      expect { click_button "参考になった" }.to change { Like.count }.by(1)
      expect(page).to have_content "1人"
    end

    it '同じIPアドレスから参考になったボタンを２回押しても初回しかカウントされないこと' do
      expect { click_button "参考になった" }.to change { Like.count }.by(1)
      expect { click_button "参考になった" }.to change { Like.count }.by(0)
    end
  end
end
