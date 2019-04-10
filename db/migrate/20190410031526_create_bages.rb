class CreateBages < ActiveRecord::Migration[5.2]
  def change
    create_table :bages do |t|
      t.string :name, null: false
      t.string :image_url, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
