class CreateGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :creator, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
