# frozen_string_literal: true

class AddAuthorToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :author, foreign_key: true
  end
end
