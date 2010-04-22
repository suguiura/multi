class Rejection < ActiveRecord::Base
  belongs_to :session
  belongs_to :problem
  
  def problem_id=(id)
    self.problem = Problem.find(id)
  end
end
