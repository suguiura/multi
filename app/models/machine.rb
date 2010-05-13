class Machine < ActiveRecord::Base
  has_many :sessions, :dependent => :destroy
  
  validates_presence_of :code, :totalHeaders, :speed
  validates_numericality_of :speed
  validates_numericality_of :totalHeaders, :only_integer => true
  validates_numericality_of :availableTime, :only_integer => true
  
  composed_of :available_time_select, :class_name => 'Time',
    :mapping => %w(availableTime to_i),
    :constructor => Proc.new { |x| Time.at(x || 0) }
  
  def total_session_time
    total = 0
    self.sessions.each { |session| total += session.duration.to_i }
    total
  end
  
  def average_session_time
    return total_session_time / self.sessions.size if self.sessions.size > 0
  end
  
  def average_work_time_per_day
    set = Set.new
    self.sessions.each { |session| set << session.start.to_date }
    return total_session_time / set.size if set.size > 0
  end
  
  def utilization_percent_per_day
    return average_work_time_per_day.to_f / availableTime if availableTime > 0
  end
  
  def xls_column_names
    self.class.column_names + ['total_session_time'] - ['created_at', 'updated_at']
  end
end
