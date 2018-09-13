class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :occasion, foreign_key: true

      t.timestamps null:false

    end
  end
end
