class Test < ApplicationRecord
  def self.list_by_category(title)
    joins("JOIN categories ON tests.category_id = categories.id")
    .where("categories.title = ?", title)
    .order('title DESC')
    .pluck(:title)
  end
end
