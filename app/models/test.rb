class Test < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  def self.find_all_by_category_name(category_name)
    joins("INNER JOIN categories ON categories.id = tests.category_id")
      .where(categories: { title: category_name })
      .order(name: :desc)
      .pluck(:name)
  end
end
