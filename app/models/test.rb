class Test < ApplicationRecord
  belongs_to :category

  def self.sort_by_category(category)
    Test.joins(:category).where(categories: {title: category})
    .pluck(:title).sort.reverse
  end
end
