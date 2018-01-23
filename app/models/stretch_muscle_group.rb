class StretchMuscleGroup < ActiveRecord::Base
  belongs_to :stretch
  belongs_to :muscle_group
end
