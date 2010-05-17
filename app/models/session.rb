class Session < ActiveRecord::Base
  belongs_to :machine
  belongs_to :product
  has_many :rejections, :dependent => :destroy

  def duration
    self.end - self.start
  end

  def production
    1 # mock
  end

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
