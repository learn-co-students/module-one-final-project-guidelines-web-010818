class Stretch < ActiveRecord::Base
  has_many :stretch_muscle_groups
  has_many :muscle_groups, through: :stretch_muscle_groups
  has_many :workout_stretches
  has_many :workouts, through: :workout_stretches
  #mg = muscle_group

  def self.find_stretches_by_mg_id(mg_id)
    relationships = StretchMuscleGroup.where("muscle_group_id = ?", mg_id)
    stretches_arr = []
    relationships.each do |stretch_mg|
      stretch = Stretch.find(stretch_mg.stretch_id)
      stretches_arr << stretch
    end
    stretches_arr
  end

  def self.find_stretch_by_id(id)
    Stretch.find(id)
  end

  def self.display_stretches(stretches_arr)
    stretches_arr.each do |stretch|
      puts "#{stretch.id}. #{stretch.name}, favorited #{stretch.stars_count} times."
    end
  end

  def self.find_and_add_star_count_by_stretch_id(id)
    stretch = Stretch.find(id)
    stretch.stars_count += 1
    stretch.save
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
