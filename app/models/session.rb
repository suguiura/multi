class Session < ActiveRecord::Base
  belongs_to :machine
  has_many :rejections, :dependent => :destroy

  default_scope :select => '*, strftime("%s",end) - strftime("%s",start) as "duration"'

  def machine_id=(id)
    self.machine = Machine.find(id)
  end
  def machine_id()
    self.machine.id if self.machine
  end
  
  def xls_column_names
    self.class.column_names - ['created_at', 'updated_at']
  end
end
