class WorkoutStretch < ActiveRecord::Base
  belongs_to :workout
  belongs_to :stretch
end
