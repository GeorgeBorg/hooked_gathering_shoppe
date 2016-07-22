class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.string :bio

      t.timestamps null: false
    end
  end
end
