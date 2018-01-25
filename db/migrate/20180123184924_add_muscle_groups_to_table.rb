class AddMuscleGroupsToTable < ActiveRecord::Migration[5.0]
  def change
    MuscleGroup.create(name: "Hamstring")
    MuscleGroup.create(name: "Lower Back")
    MuscleGroup.create(name: "Glutes")
    MuscleGroup.create(name: "Neck and Shoulders")
    MuscleGroup.create(name: "Arms")
    MuscleGroup.create(name: "Feet")
    MuscleGroup.create(name: "Hips")
    MuscleGroup.create(name: "Legs")
  end
end
