class Test < ApplicationRecord
  belongs_to :category

  def self.sort_by_category(category)
    Test.joins('JOIN categories on tests.category_id = categories.id')
    .where(categories: {title: category}).order('title DESC')
  end
end
