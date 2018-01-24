class Stretch < ActiveRecord::Base
  has_many :stretch_muscle_groups
  has_many :muscle_groups, through: :stretch_muscle_groups

  has_many :workout_stretches
  has_many :workouts, through: :workout_stretches
  #mg = muscle_group



  def self.display_stretches(user_mg_id)
    relationships = StretchMuscleGroup.where("muscle_group_id = ?", user_mg_id)
    relationships.map do |instance_of_StretchMuscleGroup|
      stretch = Stretch.find(instance_of_StretchMuscleGroup.stretch_id)
        puts "#{stretch.id}. #{stretch.name}"
    end
  end


  def self.find_and_add_stretch_to_workout(user_stretch_id)
    user_stretch = Stretch.find(user_stretch_id)
    new_workout = Workout.find_or_create_by(name: "#{@@current_user.name}'s workout")
    WorkoutStretch.create(workout_id: new_workout.id, stretch_id: user_stretch_id)
  end

end



####use for education component later
#   def stretch_mg_relationships
#     StretchMuscleGroup.where("stretch_id = ?", self.id)
#   end
#
#   def muscle_groups
#     stretch_mg_relationships.map do |relationship|
#       MuscleGroup.where("id = ?", relationship.muscle_group_id)
#     end
#   end
