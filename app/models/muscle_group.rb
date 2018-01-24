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








end
