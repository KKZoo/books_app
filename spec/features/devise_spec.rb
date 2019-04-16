# frozen_string_literal: true

require "rails_helper"

RSpec.describe "book", type: :feature do
  scenario "deviseのログインテスト" do
    @user = create(:user)
    visit root_path
    expect(current_url).to eq "#{Capybara.default_host}" + "/users/sign_in"
    fill_in I18n.t("activerecord.attributes.user.email"), with: "admin@gmail.com"
    fill_in I18n.t("activerecord.attributes.user.password"), with: "1234567"
    click_button I18n.t("devise.shared.links.sign_in")
    visit root_path
    expect(current_url).to eq "#{Capybara.default_host}" + "/"
  end

  scenario "deviseのログアウトテスト" do
    @user = create(:user)
    sign_in @user
    visit root_path
    expect(current_url).to eq "#{Capybara.default_host}" + "/"
    click_on I18n.t("books.index.sign_out")
    visit root_path
    expect(current_url).to eq "#{Capybara.default_host}" + "/users/sign_in"
  end
end
