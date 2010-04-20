class Rejection < ActiveRecord::Base
  belongs_to :session
  belongs_to :problem
end
