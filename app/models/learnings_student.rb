class LearningsStudent < ActiveRecord::Base
  belongs_to :learning
  belongs_to :student
end
