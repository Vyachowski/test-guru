class Badge < ApplicationRecord
  has_many :user_bages
  has_many :users, through: :user_badges

  RULE_TYPES = %w[all_in_category first_try all_of_level].freeze

  scope :active, -> { where(active: true) }

  validates :name, :image_url, :rule_type, presence: true
  validates :rule_type, inclusion: { in: RULE_TYPES }
end
