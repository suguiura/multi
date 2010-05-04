class Rejection < ActiveRecord::Base
  belongs_to :session
  belongs_to :problem
  
  validates_presence_of :totalRejected
  
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
end
