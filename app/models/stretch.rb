class Stretch < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  has_many :stretch_muscle_group
  has_many :muscle_groups, through: :stretch_muscle_group

  #mg = muscle_group

  # def stretch_instances_of_mg
  #   StretchMuscleGroup.where("stretch_id = ?", self.id)
  # end



  def stretch_mg_relationships
    StretchMuscleGroup.where("stretch_id = ?", self.id)
  end

  def muscle_groups
    stretch_mg_relationships.map do |relationship|
      MuscleGroup.where("id = ?", relationship.muscle_group_id)
    end
  end


  # def self.find_stretches_by_mg(user_input)
  #   stretches = []
  #   relevant_stretch_mg = StretchMuscleGroup.where("muscle_group_id = ?", user_input)
  #   releavant_stretch_mg.each do |stretch_mg|
  #     stretches << Stretch.where("id = ?", stretch_mg.stretch_id)
  #   end
  #   stretches
  #
  # end




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
