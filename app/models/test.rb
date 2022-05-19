class Test < ApplicationRecord
  def self.list_by_category(category)
    # как же уродливо выглядит этот запрос...
    # не уверен в том в каком виде требуется вернуть массив, поэтому для перестраховки сделал ему each
    tests = Test.select('title')
    .joins("JOIN categories ON tests.category_id = categories.id")
    .where("categories.title = ?", category)
    .order('title DESC')
    
    tests.each{|t| t.title}
  end
end
