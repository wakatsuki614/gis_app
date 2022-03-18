require 'rails_helper'

RSpec.feature "Beginners", type: :feature do
  feature "GET /beginners" do
    scenario '新規会員登録をクリックすると新規会員登録ページへ遷移する' do
      visit beginners_path
      find(".signup-link_beginner").click
      expect(current_path).to eq signup_path
    end
  end
end
