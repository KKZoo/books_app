# frozen_string_literal: true

require "rails_helper"

RSpec.describe "book", type: :feature do
  scenario "New Bookのテスト" do
    visit root_path
    click_on "New Book"
    expect(current_url).to eq "#{Capybara.default_host}" + "/books/new"
  end

  scenario "本の登録" do
    visit new_path
    fill_in "Title", with: "test"
    fill_in "Memo", with: "This is test"
    fill_in "Author", with: "KKZoo"
    click_button "Create Book"
    expect(current_url).to eq "#{Capybara.default_host}" + "/books/1"
    expect(page).to have_content "test"
    expect(page).to have_content "This is test"
    expect(page).to have_content "KKZoo"
  end

  scenario "登録情報の更新" do
    book = Book.create(title: "test", memo: "This is test", author: "KKZoo")
    visit root_path
    click_on "Edit"
    fill_in "Title", with: "Update title"
    fill_in "Memo", with: "Update test"
    fill_in "Author", with: "Update author"
    click_button "Update Book"
    expect(current_url).to eq "#{Capybara.default_host}" + "/books/1"
    expect(page).to have_content "Update title"
    expect(page).to have_content "Update test"
    expect(page).to have_content "Update author"
  end

  scenario "登録情報の削除" do
    book = Book.create(title: "test", memo: "This is test", author: "KKZoo")
    visit root_path
    click_on "Destroy"
    expect(page).to have_content "Book was successfully destroyed."
    expect(page).to have_no_content "test"
    expect(page).to have_no_content "This is test"
    expect(page).to have_no_content "KKZoo"
  end
end
