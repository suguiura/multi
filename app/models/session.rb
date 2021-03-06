class Session < ActiveRecord::Base
  belongs_to :machine
  belongs_to :product
  belongs_to :operator
  has_many :rejections, :dependent => :destroy
  
  composed_of :duration_select, :class_name => 'Time',
    :mapping => %w(duration to_i),
    :constructor => Proc.new { |x| Time.at(x || 0) }

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

  def operator_id=(id)
    self.operator = Operator.find(id)
  end
  def operator_id
    self.operator.id if self.operator
  end
  
  def xls_column_names
    self.class.column_names - ['created_at', 'updated_at']
  end
end
