class Prototype < ApplicationRecord
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  # validates :user, presence: true, foreign_key: true
  validates :image, presence: true


  belongs_to :user
  has_many :comments
  has_many :users, through: :comments

  has_one_attached :image #追加

end
