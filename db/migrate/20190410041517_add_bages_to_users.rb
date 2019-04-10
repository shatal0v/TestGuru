class AddBagesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :bages, foreign_key: true
  end
end
