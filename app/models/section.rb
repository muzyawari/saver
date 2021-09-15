class Section < ApplicationRecord
  belongs_to :folder
  has_one :user, through: :folder
  has_many :tasks, dependent: :destroy
  has_many :timers, dependent: :destroy
  enum section_type: %i[todo bookmark timer]
end
