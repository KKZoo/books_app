# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Book", type: :model do
  it "This is model test" do
    book = Book.new(title: "Sample", memo: "This is a test", author: "KKZoo")
    expect(book.title).to eq "Sample"
    expect(book.memo).to eq "This is a test"
    expect(book.author).to eq "KKZoo"
  end
end
