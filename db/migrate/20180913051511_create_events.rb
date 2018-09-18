class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :date
      t.string :description

      t.belongs_to :user, foreign_key: true

      t.timestamps null:false
    end
  end
end
