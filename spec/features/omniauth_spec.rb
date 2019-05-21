require "rails_helper"

feature "login" do
  before do
    OmniAuth.config.mock_auth[:github] = nil
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
  end

  scenario "github連携でサインアップする" do
    visit root_path
    expect(current_path).to eq user_session_path
    click_link "GitHubでログイン"
    sleep 1
    expect(current_path).to eq root_path
  end
end
