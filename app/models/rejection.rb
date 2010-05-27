class Rejection < ActiveRecord::Base
  belongs_to :session
  belongs_to :problem
  
  validates_presence_of :number_of_rejected_packages
  
  def session_id=(id)
    self.session = Session.find(id)
  end
  def session_id()
    self.session.id if self.session
  end

  def problem_id=(id)
    self.problem = Problem.find(id)
  end
  def problem_id()
    self.problem.id if self.problem
  end
  
  def xls_column_names
    self.class.column_names - ['created_at', 'updated_at']
  end
end
