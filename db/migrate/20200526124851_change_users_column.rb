# frozen_string_literal: true

class ChangeUsersColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password, :string
  end
end
