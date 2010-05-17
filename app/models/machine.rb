class Machine < ActiveRecord::Base
  has_many :sessions, :dependent => :destroy
  
  validates_presence_of :code, :number_of_heads, :standard_speed
  validates_numericality_of :standard_speed
  validates_numericality_of :number_of_heads, :only_integer => true
  validates_numericality_of :avaiable_seconds_per_day, :only_integer => true
  
  composed_of :available_time_select, :class_name => 'Time',
    :mapping => %w(avaiable_seconds_per_day to_i),
    :constructor => Proc.new { |x| Time.at(x || 0) }


  def total_session_time # derived attribute
    total = 0
    self.sessions.each { |session| total += session.duration.to_i }
    total
  end
  
  def production_amount # derived attribute
    total = 0
    self.sessions.each { |session| total += session.number_of_packages }
    total
  end
  
  def productive_days # derived attribute
    set = Set.new
    self.sessions.each { |session| set << session.start.to_date }
    set.size
  end
  
  def session_time_average # derived attribute
    return total_session_time / self.sessions.size if self.sessions.size > 0
  end
  
  def daily_session_time_average # derived attribute
    days = self.productive_days
    days > 0 ? total_session_time / days : 0
  end
  
  def utilization_percent # derived attribute
    avaiable_seconds_per_day > 0 ? daily_session_time_average.to_f / avaiable_seconds_per_day : 0
  end
  
  def daily_production_average # derived attribute
    days = self.productive_days
    days > 0 ? production_amount.to_f / days : 0
  end
  
  def daily_productive_time_average # derived attribute
    standard_speed > 0 ? daily_production_average.to_f / standard_speed : 0
  end
  
  def eficiency_percent # derived attribute
    daily_productive_time_average.to_f / daily_session_time_average
  end
  
  def productivity_percent # derived attribute
    daily_productive_time_average.to_f / avaiable_seconds_per_day
  end
  
  def xls_column_names
    self.class.column_names + ['total_session_time'] - ['created_at', 'updated_at']
  end
end
