class Task < ApplicationRecord
  belongs_to :section
  has_one :folder, through: :section
  enum completed: %i[todo doing completed], _default: :todo
  # default_scope -> { order(:date) }  # Our tasks will be ordered by their start_date by default

  # Add the lines below if you need multidays events recorded in calender.
  # def multi_days?
  #   (end_time.to_date - start_time.to_date).to_i >= 1
  # end
end
