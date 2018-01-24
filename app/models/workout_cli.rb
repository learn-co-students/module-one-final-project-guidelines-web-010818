class WorkoutCli < ActiveRecord::Base

  def self.put_muscle_groups
    puts "What muscle would you like to stretch?"
    MuscleGroup.display_mg
  end

  def self.display_relevant_stretches
    user_mg_id = gets.chomp.to_i
    Stretch.display_stretches(user_mg_id)
  end

  def self.compile_workout
    user_stretch_id = gets.chomp.to_i
    Stretch.find_and_add_stretch_to_workout(user_stretch_id)
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
    Workout.run_current_workout
  end

  # def self.choose_favorite
  #   puts "Choose your favorite stretch"
  #   @@current_user.display_workout_names
  #   user_input_fav = gets.chomp.to_i
  #   @@current_user.add_stretch_to_fav(user_input_fav)
  # end

  def self.run
    while count < 2 ######       #change back to five  #make workout a table
      put_muscle_groups
      display_relevant_stretches
      compile_workout
    end
    start_workout
    # choose_favorite
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
