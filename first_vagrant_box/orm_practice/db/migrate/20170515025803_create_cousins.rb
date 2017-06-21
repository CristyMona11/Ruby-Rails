class CreateCousins < ActiveRecord::Migration
  def change
    create_table :cousins do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age

      t.timestamps null: false
    end
  end
end
