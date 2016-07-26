class Post < ActiveRecord::Base
  belongs_to :user

  scope :sorted_by_votes, -> { order(votes: :DESC) }
  scope :popular, -> { where("votes > ?", 500) }

  validates :name, presence: true
  validates :url, presence: true

  # TODO: Copy-paste your code from previous exercise
end

