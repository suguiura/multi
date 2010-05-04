class Machine < ActiveRecord::Base
  has_many :sessions, :dependent => :destroy
  
  validates_presence_of :code, :totalHeaders
  validates_numericality_of :totalHeaders, :only_integer => true
  validates_numericality_of :availableTime, :only_integer => true
end
