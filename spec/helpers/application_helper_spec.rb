require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#full_title" do
    subject { full_title(page_title) }

    context "page_titleが存在する場合に動的な表示がなされること" do
      let(:page_title) { "sample" }
      it { expect(subject).to eq "sample | GI Sports" }
    end

    context "page_titleが空白の場合に動的な表示がなされること" do
      let(:page_title) { "" }
      it { expect(subject).to eq "GI Sports" }
    end

    context "page_titleがnilの場合に動的な表示がなされること" do
      let(:page_title) { nil }
      it { expect(subject).to eq "GI Sports" }
    end
  end
end
