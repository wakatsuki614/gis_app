require 'rails_helper'

RSpec.feature "Schools", type: :feature do
  given!(:user)   { create(:user) }
  given!(:school) { create(:school) }

  background do
    visit login_path
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    find(".login-test").click
  end

  feature "GET /schools" do
    background do
      visit schools_path
    end

    scenario '編集をクリックするとschools#editへ遷移する' do
      click_link "編集"
      expect(current_path).to eq edit_school_path(school)
    end

    scenario 'スクール名表示テスト' do
      expect(page).to have_content school.school_name
    end

    scenario '所在地表示テスト' do
      expect(page).to have_content school.address
    end

    scenario '最終更新日表示テスト' do
      expect(page).to have_content school.updated_at.strftime("%Y/%-m/%-d")
    end
  end

  feature "GET /schools/:id" do
    background do
      visit school_path(school)
    end

    scenario 'スクール名表示テスト' do
      expect(page).to have_content school.school_name
    end

    scenario '画像表示テスト' do
      expect(page).to have_selector "img, [src$='test.jpg']"
    end

    scenario '所在地表示テスト' do
      expect(page).to have_content school.address
    end

    scenario 'スクール紹介表示テスト' do
      expect(page).to have_content school.introduce
    end

    scenario 'ホームページ表示テスト' do
      expect(page).to have_content school.home_page
    end

    scenario '電話番号表示テスト' do
      expect(page).to have_content school.phone
    end

    scenario 'スクールEメール表示テスト' do
      expect(page).to have_content school.school_email
    end
  end

  feature "GET /search" do
    background do
      visit search_path
    end

    scenario 'スクール画像表示テスト' do
      expect(page).to have_selector "img, [src$='test.jpg']"
    end

    scenario 'スクール名表示テスト' do
      expect(page).to have_content school.school_name
    end

    scenario '所在地表示テスト' do
      expect(page).to have_content school.address
    end

    scenario 'スクール詳細をクリックするとschools#showへ遷移する' do
      click_link "スクール詳細"
      expect(current_path).to eq school_path(school)
    end
  end
end
