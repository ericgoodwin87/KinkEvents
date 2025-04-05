class AddAcceptedToMemberships < ActiveRecord::Migration[8.0]
  def change
    add_column :memberships, :accepted, :boolean, default: false, null: false
  end
end