class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  RULE_TYPES = %w[all_in_category all_of_level passed_on_attempt].freeze

  scope :active, -> { where(active: true) }

  validates :name, :image_url, :rule_type, presence: true
  validates :rule_type, inclusion: { in: RULE_TYPES }
end
