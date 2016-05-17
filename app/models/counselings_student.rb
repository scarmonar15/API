class CounselingsStudent < ActiveRecord::Base
  belongs_to :counseling
  belongs_to :student
end
