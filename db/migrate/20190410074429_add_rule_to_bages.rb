class AddRuleToBages < ActiveRecord::Migration[5.2]
  def change
    add_column :bages, :rule, :string
  end
end
