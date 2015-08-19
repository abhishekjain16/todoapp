class Task < ActiveRecord::Base
  validates :name, :start_time, :end_time, presence: true
end