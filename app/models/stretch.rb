class Stretch < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  has_many :stretch_muscle_group
  has_many :muscle_groups, through: :stretch_muscle_group


end



# MuscleGroup.create(name: "Hamstring")
# MuscleGroup.create(name: "Lower Back")
# MuscleGroup.create(name: "Glutes")
# MuscleGroup.create(name: "Neck and Shoulders")
# MuscleGroup.create(name: "Arms")
# MuscleGroup.create(name: "Feet")
# MuscleGroup.create(name: "Hips")
# MuscleGroup.create(name: "Legs")
# MuscleGroup.create(name: "Face")
