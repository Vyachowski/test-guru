class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: :creator_id

  has_many :questions
  has_many :users, through: :tests_passages

  def self.find_all_by_category_name(category_name)
    joins(:category)
      .where(categories: { title: category_name })
      .order(name: :desc)
      .pluck(:name)
  end
end
