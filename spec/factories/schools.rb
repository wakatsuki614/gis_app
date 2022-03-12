FactoryBot.define do
  factory :school do
    id           { 1 }
    user_id      { 1 }
    school_name  { "GIスクール" }
    school_email { "gisports@example.com" }
    image        { File.open(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    introduce    { "スクール紹介" }
    address      { "埼玉県鴻巣市" }
    phone        { "090-1234-5678" }
    home_page    { "https://gisports.com" }
  end

  factory :school1, class: "School" do
    id           { 1 }
    user_id      { 1 }
    school_name  { "GIスクール1" }
    school_email { "gisports1@example.com" }
    image        { File.open(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    introduce    { "スクール紹介" }
    address      { "埼玉県鴻巣市" }
    phone        { "090-1234-5678" }
    home_page    { "https://gisports1.com" }
  end

  factory :school2, class: "School" do
    id           { 2 }
    user_id      { 1 }
    school_name  { "GIスクール2" }
    school_email { "gisports2@example.com" }
    image        { File.open(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    introduce    { "スクール紹介" }
    address      { "茨城県水戸市" }
    phone        { "090-1234-5678" }
    home_page    { "https://gisports2.com" }
  end
end
