class CreateMemberships < ActiveRecord::Migration[8.0]
  def change
    # Table already exists - adding accepted column if not present
    unless column_exists?(:memberships, :accepted)
      add_column :memberships, :accepted, :boolean, default: false, null: false
    end
  end
end