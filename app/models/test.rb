class Test < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  belongs_to :category

  def self.find_all_by_category_name(category_name)
    joins(:category)
      .where(categories: { title: category_name })
      .order(name: :desc)
      .pluck(:name)
  end
end
