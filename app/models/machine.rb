class Machine < ActiveRecord::Base
  has_many :sessions, :dependent => :destroy
  
  validates_presence_of :code

  validates_presence_of :standard_number_of_packages_per_second
  validates_numericality_of :standard_number_of_packages_per_second

  validates_presence_of :number_of_heads
  validates_numericality_of :number_of_heads, :only_integer => true

  validates_presence_of :avaiable_seconds_per_day
  validates_numericality_of :avaiable_seconds_per_day, :only_integer => true
  
  composed_of :available_time_select, :class_name => 'Time',
    :mapping => %w(avaiable_seconds_per_day to_i),
    :constructor => Proc.new { |x| Time.at(x || 0) }

  def total_session_time # derived attribute
    total = 0
    sessions.each { |session| total += session.duration }
    total
  end
  
  def number_of_packages # derived attribute
    total = 0
    sessions.each { |session| total += session.number_of_packages }
    total
  end
  
  def productive_days # derived attribute
    set = Set.new
    sessions.each { |session| set << session.start.to_date }
    set.size
  end
  
  def session_time_average # derived attribute
    number_of_sessions = sessions.size
    total_session_time.to_f / number_of_sessions
  end
  
  def daily_session_time_average # derived attribute
    days = productive_days
    total_session_time.to_f / days
  end
  
  def daily_number_of_packages_average # derived attribute
    days = productive_days
    number_of_packages.to_f / days
  end
  
  def daily_productive_time_average # derived attribute
    speed = standard_number_of_packages_per_second
    daily_number_of_packages_average.to_f / speed
  end
  
  def utilization_percent # derived attribute
    daily_session_time_average.to_f / avaiable_seconds_per_day
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
