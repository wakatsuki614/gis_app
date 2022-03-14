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

  feature "地域で検索" do
    background do
      visit root_path
    end

    scenario 'ドロップダウンが動作すること（北海道・東北地方）', js: true do
      expect(page).not_to have_link "岩手県", href: "/search?keyword=岩手県"
      click_button "北海道・東北地方"
      expect(page).to have_link "岩手県", href: "/search?keyword=岩手県"
    end

    scenario 'ドロップダウンが動作すること（関東地方）', js: true do
      expect(page).not_to have_link "栃木県", href: "/search?keyword=栃木県"
      click_button "関東地方"
      expect(page).to have_link "栃木県", href: "/search?keyword=栃木県"
    end

    scenario 'ドロップダウンが動作すること（甲信越・北陸地方）', js: true do
      expect(page).not_to have_link "福井県", href: "/search?keyword=福井県"
      click_button "甲信越・北陸地方"
      expect(page).to have_link "福井県", href: "/search?keyword=福井県"
    end

    scenario 'ドロップダウンが動作すること（中部・東海地方）', js: true do
      expect(page).not_to have_link "三重県", href: "/search?keyword=三重県"
      click_button "中部・東海地方"
      expect(page).to have_link "三重県", href: "/search?keyword=三重県"
    end

    scenario 'ドロップダウンが動作すること（近畿地方）', js: true do
      expect(page).not_to have_link "奈良県", href: "/search?keyword=奈良県"
      click_button "近畿地方"
      expect(page).to have_link "奈良県", href: "/search?keyword=奈良県"
    end

    scenario 'ドロップダウンが動作すること（中国地方）', js: true do
      expect(page).not_to have_link "山口県", href: "/search?keyword=山口県"
      click_button "中国地方"
      expect(page).to have_link "山口県", href: "/search?keyword=山口県"
    end

    scenario 'ドロップダウンが動作すること（四国地方）', js: true do
      expect(page).not_to have_link "徳島県", href: "/search?keyword=徳島県"
      click_button "四国地方"
      expect(page).to have_link "徳島県", href: "/search?keyword=徳島県"
    end

    scenario 'ドロップダウンが動作すること（九州地方・沖縄）', js: true do
      expect(page).not_to have_link "大分県", href: "/search?keyword=大分県"
      click_button "九州地方・沖縄"
      expect(page).to have_link "大分県", href: "/search?keyword=大分県"
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
