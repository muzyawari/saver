class Folder < ApplicationRecord
  belongs_to :user
  has_many :sections, dependent: :destroy
  has_many :tasks, through: :sections, dependent: :destroy
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_one_attached :photo
end
