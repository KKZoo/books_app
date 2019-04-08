# frozen_string_literal: true

require "rails_helper"

RSpec.describe "book", type: :feature do
  scenario "New Bookのテスト" do
    visit root_path
    click_on I18n.t("books.index.new")
    expect(current_url).to eq "#{Capybara.default_host}" + "/books/new"
  end

  scenario "本の登録" do
    visit new_path
    fill_in I18n.t("activerecord.attributes.book.title"), with: "test"
    fill_in I18n.t("activerecord.attributes.book.memo"), with: "This is test"
    fill_in I18n.t("activerecord.attributes.book.author"), with: "KKZoo"
    click_button "Create Book"
    expect(current_url).to eq "#{Capybara.default_host}" + "/books/1"
    expect(page).to have_content "test"
    expect(page).to have_content "This is test"
    expect(page).to have_content "KKZoo"
  end

  scenario "登録情報の更新" do
    book = Book.create(title: "test", memo: "This is test", author: "KKZoo")
    visit root_path
    click_on I18n.t("books.index.edit")
    fill_in I18n.t("activerecord.attributes.book.title"), with: "Update title"
    fill_in I18n.t("activerecord.attributes.book.memo"), with: "Update test"
    fill_in I18n.t("activerecord.attributes.book.author"), with: "Update author"
    click_button "Update Book"
    expect(current_url).to eq "#{Capybara.default_host}" + "/books/1"
    expect(page).to have_content "Update title"
    expect(page).to have_content "Update test"
    expect(page).to have_content "Update author"
  end

  scenario "登録情報の削除" do
    book = Book.create(title: "test", memo: "This is test", author: "KKZoo")
    visit root_path
    click_on I18n.t("books.index.destroy")
    expect(page).to have_content "Book was successfully destroyed."
    expect(page).to have_no_content "test"
    expect(page).to have_no_content "This is test"
    expect(page).to have_no_content "KKZoo"
  end
end
