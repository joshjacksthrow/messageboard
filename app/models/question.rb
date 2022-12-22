class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  validates :title, :body, presence: true
  validates :title, length: { maximum: 200, minimum: 10 }
  validates :body, length: { maximum: 1000 }
end
