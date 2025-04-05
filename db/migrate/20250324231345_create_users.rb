class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    # Add Devise-required fields to existing users table
    add_column :users, :encrypted_password, :string, null: false, default: "" unless column_exists?(:users, :encrypted_password)
    # Optional: Add more Devise features if desired
    add_column :users, :reset_password_token, :string unless column_exists?(:users, :reset_password_token)
    add_column :users, :reset_password_sent_at, :datetime unless column_exists?(:users, :reset_password_sent_at)
    add_column :users, :remember_created_at, :datetime unless column_exists?(:users, :remember_created_at)
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
    end
    add_index :users, :email, unique: true
  end
end
