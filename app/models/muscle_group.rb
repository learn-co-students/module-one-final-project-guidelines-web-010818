class MuscleGroup < ActiveRecord::Base
  has_many :user_muscle_groups
  has_many :users, through: :user_muscle_groups

  has_many :stretch_muscle_groups
  has_many :stretches, through: :stretch_muscle_groups
end
