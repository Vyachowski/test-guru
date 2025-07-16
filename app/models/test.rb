class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: :creator_id

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :name, uniqueness: { scope: :level }
  validates :level,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy,   -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard,   -> { where(level: 5..Float::INFINITY) }

  scope :by_difficulty,    ->(level) { where(level: level) }
  scope :by_category_name, ->(name)  { joins(:category).where(categories: { title: name }).order(name: :desc) }
end
