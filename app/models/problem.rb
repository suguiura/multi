class Problem < ActiveRecord::Base
  has_many :rejections, :dependent => :destroy
  
  validates_presence_of :name
end
