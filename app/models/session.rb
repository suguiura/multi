class Session < ActiveRecord::Base
  belongs_to :machine
  belongs_to :product
  has_many :rejections, :dependent => :destroy

  def duration
    self.end - self.start
  end

  def number_of_boards
    self.product.number_of_boards_per_package * self.number_of_packages
  end

  def number_of_holes
    self.product.number_of_holes_per_board * self.number_of_boards
  end

  def machine_id=(id)
    self.machine = Machine.find(id)
  end
  def machine_id
    self.machine.id if self.machine
  end

  def product_id=(id)
    self.product = Product.find(id)
  end
  def product_id
    self.product.id if self.product
  end
  
  def xls_column_names
    self.class.column_names - ['created_at', 'updated_at']
  end
end
