class CreateOccasions < ActiveRecord::Migration[5.2]
  def change
    create_table :occasions do |t|
      t.string :name
      t.string :description
      t.date :date

      t.timestamps null:false
    end
  end
end
