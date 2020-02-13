class Hashtag < ApplicationRecord
  validates :term, presence: true
  validates :term, format: { without: /\s/ }
end
