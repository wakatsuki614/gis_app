require 'rails_helper'

RSpec.describe "Schools", type: :system do
  let!(:user) { create(:user) }

  describe "GET /schools/new" do
    before do
      visit login_path
      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password
      find(".login-test").click
      visit new_school_path
    end

    it '正しい情報を入力するとスクール情報が登録できること' do
      fill_in "school[school_name]", with: "GIスクール"
      fill_in "school[school_email]", with: "gisports@example.com"
      fill_in "school[phone]", with: "090-1234-5678"
      fill_in "school[address]", with: "埼玉県鴻巣市"
      expect { click_button "登録" }.to change { School.count }.by(1)
    end

    it '誤った情報ではスクール情報が登録できないこと' do
      fill_in "school[school_name]", with: ""
      fill_in "school[school_email]", with: ""
      fill_in "school[phone]", with: ""
      fill_in "school[address]", with: ""
      expect { click_button "登録" }.to change { School.count }.by(0)
    end
  end

  describe "GET /schools/:id/edit" do
    let!(:school) { create(:school) }

    it 'スクール情報が削除できること' do
      visit login_path
      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password
      find(".login-test").click
      visit edit_school_path(school)
      expect { click_on "スクール情報削除" }.to change { School.count }.by(-1)
    end
  end
end
