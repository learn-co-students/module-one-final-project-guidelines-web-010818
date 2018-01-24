class Workout < ActiveRecord::Base

  def self.put_muscle_groups
    puts "What muscle would you like to stretch?"
    MuscleGroup.display_mg
  end

  def self.display_relevant_stretches
    user_mg_id = gets.chomp.to_i
    #find stretch_id for userinput
    #puts "#{stretch.id}. #{stretch.name}"
  end

  def self.compile_workout
    user_stretch_id = gets.chomp.to_i
    add_to_workout(user_stretch_id)

  end

  def self.start_workout
    puts "Starting workout in..."
    sleep 1
    puts "3..."
    sleep 2
    puts "2..."
    sleep 2
    puts "1..."
    sleep 1
    puts "go!"
    @workout.each do |stretch_instance|
      puts stretch_instance.name
      #insert picture / link to video
      puts stretch_instance.instructions
      sleep 10
    end
  end

  def self.choose_favorite
    puts "Choose your favorite stretch"
    @workout.each do |stretch_instance|
      puts "#{stretch_instance.id}. #{stretch_instance.name}"
    end
    user_input = gets.chomp.to_i
    binding.pry
    Favorite.create(user_id: self.id, stretch_id: user_input)
  end

  def self.run
    while @workout.length < 2       #change back to five
      display_muscle_groups
      display_relevant_stretches
      compile_workout
    end
    start_workout
    choose_favorite
  end

end







#workout.rb
  #1) ask_body_part
    #if body_part -> while input != start routine || time <= stretch length = 5
                  #-> show relevant poses
                  #-> select stretch(es)
                  #-> save stretch to routine
                  #-> time += stretch.time
    #else -> fullbody

  #2) launch routine
  #3) ask for favorite pose(s)
    # +=1 to star_count(s)
