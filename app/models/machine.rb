class Machine < ActiveRecord::Base
  has_many :sessions, :dependent => :destroy
  
  validates_presence_of :code, :number_of_heads, :standard_number_of_packages_per_second

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
    self.filtered_sessions.each { |session| total += session.duration.to_i }
    total
  end
  
  def number_of_packages # derived attribute
    total = 0
    self.filtered_sessions.each { |session| total += session.number_of_packages }
    total
  end
  
  def productive_days # derived attribute
    set = Set.new
    self.filtered_sessions.each { |session| set << session.start.to_date }
    set.size
  end
  
  def session_time_average # derived attribute
    return total_session_time / self.filtered_sessions.size if self.filtered_sessions.size > 0
  end
  
  def daily_session_time_average # derived attribute
    days = self.productive_days
    days > 0 ? total_session_time / days : 0
  end
  
  def utilization_percent # derived attribute
    avaiable_seconds_per_day > 0 ? daily_session_time_average.to_f / avaiable_seconds_per_day : 0
  end
  
  def daily_number_of_packages_average # derived attribute
    days = self.productive_days
    days > 0 ? number_of_packages.to_f / days : 0
  end
  
  def daily_productive_time_average # derived attribute
    standard_number_of_packages_per_second > 0 ? daily_number_of_packages_average.to_f / standard_number_of_packages_per_second : 0
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
  
  def session_condition=(hash)
    @session_condition = hash
  end
  
  def filtered_sessions
    if @session_condition.nil?
      self.sessions
    else
      start_at = @session_condition[:start_at]
      end_at = @session_condition[:end_at]
      self.sessions.date_range(start_at, end_at)
    end
  end
end
