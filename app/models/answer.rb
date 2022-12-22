class Answer < ApplicationRecord
  belongs_to :question

  validates :body, length: { maximum: 2000, minimum: 30 }
end
