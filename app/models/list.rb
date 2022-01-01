class List < ApplicationRecord
  attachment :image

  validates :title, presence: true
  validates :body, presence: true
end
