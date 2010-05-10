class Machine < ActiveRecord::Base
  has_many :sessions, :dependent => :destroy
  
  validates_presence_of :code, :totalHeaders
  validates_numericality_of :totalHeaders, :only_integer => true
  validates_numericality_of :availableTime, :only_integer => true
  
  def total_session_time
    self.sessions.sum('strftime("%s",end) - strftime("%s",start)')
  end
  
  def xls_column_names
    self.class.column_names + ['total_session_time'] - ['created_at', 'updated_at']
  end
end
