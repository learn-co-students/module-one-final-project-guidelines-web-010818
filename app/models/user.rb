class User < ActiveRecord::Base
  has_many :favorites
  has_many :stretches, through: :favorites

  has_many :user_muscle_groups
  has_many :muscle_groups, through: :user_muscle_groups


   @@workout = []


  def add_to_workout(user_stretch_id) #just integer of stretch_id
    stretch = Stretch.find(user_stretch_id)
    @@workout << stretch
  end

  def workout
    @@workout
  end


  def run_workout
    @@workout.each do |stretch|
      puts stretch.name
      #insert picture / link to video
      puts stretch.instructions
      sleep 10
    end
  end

  def display_workout_names
    @@workout.each do |stretch|
      puts "#{stretch.id}. #{stretch.name}"
    end
  end


  def add_stretch_to_fav(user_input_fav)
    Favorite.new(user_id: self.id, stretch_id: user_input_fav)
    fav_stretch = Stretch.find(user_input_fav)
    fav_stretch.stars_count += 1
  end






end
