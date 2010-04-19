class Session < ActiveRecord::Base
  belongs_to :machine
  has_many :rejections, :dependent => :destroy
end
