class MuscleGroup < ActiveRecord::Base
  has_many :stretch_muscle_groups
  has_many :stretches, through: :stretch_muscle_groups
  #mg = muscle group

  def self.display_all_mg
    all.each do |mg_instance|
      puts "#{mg_instance.id}. #{mg_instance.name}"
    end
  end

end
