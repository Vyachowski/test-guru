class Test < ApplicationRecord
  def self.find_all_by_category_name(category_name)
    joins("INNER JOIN categories ON categories.id = tests.category_id")
      .where(categories: { title: category_name })
      .order(name: :desc)
      .pluck(:name)
  end
end
