# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Book", type: :model do
  it "This is a test" do
    book = Book.new(title: "Sample", memo: "This is a test")
    expect(book.title).to eq "Sample"
    expect(book.memo).to eq "This is a test"
  end
end
