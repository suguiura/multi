class Session < ActiveRecord::Base
  belongs_to :machine
  has_many :rejections, :dependent => :destroy

  def machine_id=(id)
    self.machine = Machine.find(id)
  end
  def machine_id()
    self.machine.id if self.machine
  end
  
  def xls_column_names
    self.class.column_names - ['created_at', 'updated_at']
  end

  before_save :calculate_duration
  
  private
    def calculate_duration
      self.duration = self.end - self.start
    end
end
