class Session < ActiveRecord::Base
  belongs_to :machine
  has_many :rejections, :dependent => :destroy

  def machine_id=(id)
    self.machine = Machine.find(id)
  end
  def machine_id()
    self.machine.id if self.machine
  end
end
