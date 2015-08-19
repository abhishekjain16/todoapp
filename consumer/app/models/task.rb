class Task
  include Her::Model
  include_root_in_json true

  attributes :name, :start_time, :end_time

  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  def start_time
    self['start_time'].try(:to_time) || Time.current
  end

  def end_time
    self['end_time'].try(:to_time) || Time.current + 1.hour
  end
end