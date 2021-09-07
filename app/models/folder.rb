class Folder < ApplicationRecord
  belongs_to :user
  has_many :sections, dependent: :destroy
  has_many :tasks, through: :sections, dependent: :destroy
end
