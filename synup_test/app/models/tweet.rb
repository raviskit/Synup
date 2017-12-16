class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :retweets

  default_scope -> { order(created_at: :desc) }

  validates :text, presence: true
  validates :user_id, presence: true
end
