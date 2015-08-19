class Task
  include Her::Model
  include_root_in_json true

  attributes :name, :start_time, :end_time

  def start_time
    self['start_time'].try(:to_time) || Time.current
  end

  def end_time
    self['end_time'].try(:to_time) || Time.current + 1.hour
  end
end