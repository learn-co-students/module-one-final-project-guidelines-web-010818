class Stretch < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  has_many :stretch_muscle_group
  has_many :muscle_groups, through: :stretch_muscle_group

  #mg = muscle_group

  def mg_id_to_stretch_id

  relevant_stretches = find_stretches_by_mg_id(user_mg_id)
  relevant_stretches.each do |stretch|
    puts "#{stretch.id}. #{stretch.name}"
  end



  def self.find_stretches_by_mg_id(user_mg_id)
    relationships = StretchMuscleGroup.where("muscle_group_id = ?", user_mg_id)
    relationships.map do |relationship|
      self.where("id = ?", relationship.stretch_id)
    end
  end

  def display_relevant_stretches(user_mg_id)
    relevant_stretches = self.find_stretches_by_mg_id(user_mg_id)
    relevant_stretches.each do |stretch|
      stretch.disply_id_and_name
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
