# frozen_string_literal: true

class AddUserTextToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_text, :string
  end
end
