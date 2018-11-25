# frozen_string_literal: true

require "rails_helper"

RSpec.describe BooksController, type: :controller do
  describe "index" do
    example "indexがレスポンスを返す" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "new" do
    example "newがレスポンスを返す" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "create" do
    example "createが正常にリダイレクトする" do
      post :create, params: {
        book: { title: "test", memo: "this is a test", author: "KKZoo" }
      }
      expect(response).to be_redirect
    end
  end

  describe "update" do
    example "updateが正常にリダイレクトする" do
      book = Book.create(title: "test", memo: "this is a test", author: "KKZoo")
      patch :update, params: {
        id: book.id,
        book: { title: "update", memo: "update test", author: "update" }
      }
      expect(response).to be_redirect
    end
  end

  describe "destroy" do
    example "destroyが正常にリダイレクトする" do
      book = Book.create(title: "test", memo: "this is a test", author: "KKZoo")
      delete :destroy, params: { id: book.id }
      expect(response).to be_redirect
    end
  end
end
