# frozen_string_literal: true

class AddImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_url, :string
  end
end