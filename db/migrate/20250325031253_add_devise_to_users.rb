# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[8.0]
  def change
    change_table :users do |t|
      # Skip email - already exists
      # encrypted_password will be renamed in next migration, so skip here too
      t.string :reset_password_token unless column_exists?(:users, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:users, :reset_password_sent_at)
      t.datetime :remember_created_at unless column_exists?(:users, :remember_created_at)
    end
    # Skip email index - already added in create_users.rb
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
  end
end