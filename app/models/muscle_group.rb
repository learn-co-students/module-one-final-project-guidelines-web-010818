class MuscleGroup < ActiveRecord::Base
  has_many :user_muscle_groups
  has_many :users, through: :user_muscle_groups

  has_many :stretch_muscle_groups
  has_many :stretches, through: :stretch_muscle_groups

  #mg = muscle group

  def self.display_mg
    all.each do |mg_instance|
      puts "#{mg_instance.id}. #{mg_instance.name}"
    end
  end

  def stretch_mg_relationships
    StretchMuscleGroup.where("muscle_group_id = ?", self.id)
  end

  def stretches
    stretch_mg_relationships.map do |relationship|
      Stretch.where("id = ?", relationship.stretch_id)
    end
  end


end
