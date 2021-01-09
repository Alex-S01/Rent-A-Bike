class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :model
      t.string :condition
      t.integer :price

      t.timestamps
    end
  end
end
