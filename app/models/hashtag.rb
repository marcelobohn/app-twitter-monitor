class Hashtag < ApplicationRecord
  validates :term, presence: true
end
