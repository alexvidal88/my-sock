class Review < ApplicationRecord
  belongs_to :booking

  validates :stars, presence: true, inclusion: { in: (0..5) }
  validates :content, presence: true
end
