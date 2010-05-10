class Machine < ActiveRecord::Base
  has_many :sessions, :dependent => :destroy
  
  validates_presence_of :code, :totalHeaders
  validates_numericality_of :totalHeaders, :only_integer => true
  validates_numericality_of :availableTime, :only_integer => true
  
  def total_session_time
    total = 0
    self.sessions.each { |session| total += session.duration.to_i }
    total
  end
  
  def average_session_time
    total_session_time / self.sessions.size
  end
  
  def average_work_time_per_day
    set = Set.new
    self.sessions.each { |session| set << session.start.to_date }
    total_session_time / set.size
  end
  
  def utilization_percent_per_day
    average_work_time_per_day.to_f / availableTime
  end
  
  def xls_column_names
    self.class.column_names + ['total_session_time'] - ['created_at', 'updated_at']
  end
end
