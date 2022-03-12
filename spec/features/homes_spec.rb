require 'rails_helper'

RSpec.feature "Homes", type: :feature do
  given!(:user) { create(:user) }

  feature "検索機能" do
    given!(:school1) { create(:school1, address: "埼玉県鴻巣市") }
    given!(:school2) { create(:school2, address: "茨城県水戸市") }

    background do
      visit root_path
    end

    scenario '検索ボタンをクリックすると検索結果ページへ遷移する' do
      find(".submit_search").click
      expect(current_path).to eq search_path
    end

    scenario '埼玉県で検索をすると埼玉県と一致しない情報は表示されない' do
      fill_in "keyword", with: "埼玉県"
      find(".submit_search").click
      expect(page).to have_content school1.address
      expect(page).not_to have_content school2.address
    end
  end

  feature "新着情報" do
    given!(:school) { create(:school) }

    background do
      visit root_path
    end

    scenario '画像表示テスト' do
      expect(page).to have_selector "img, [src$='test.jpg']"
    end

    scenario 'スクール名表示テスト' do
      expect(page).to have_content school.school_name
    end

    scenario '所在地表示テスト' do
      expect(page).to have_content school.address
    end
  end
end
