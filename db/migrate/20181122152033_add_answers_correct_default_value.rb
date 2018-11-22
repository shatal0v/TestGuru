class AddAnswersCorrectDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:answers, :correct, 0)
  end
end
