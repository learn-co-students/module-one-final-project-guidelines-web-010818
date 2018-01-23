class Workout < ActiveRecord::Base


  def self.display_muscle_groups
    puts "What muscle would you like to stretch?"
    MuscleGroup.all.each do |muscle_group_instance|
      puts "#{muscle_group_instance.id}. #{muscle_group_instance.name}"
    end
  end

  def self.display_relevant_stretches
    user_input = gets.chomp
    relevant_stretch_mg = StretchMuscleGroup.where(muscle_group_id: 1)  #place holder ????

    puts "Choose a stretch:"
    relevant_stretch_mg.each do |smg|
      id = smg.stretch_id
      stretch = Stretch.find(id)
      puts "#{stretch.id}. #{stretch.name}"
    end
  end

  def self.compile_workout
    user_input = gets.chomp.to_i
    chosen_stretch = Stretch.all.find do |stretch_instance|
      stretch_instance.id == user_input
    end
    @workout << chosen_stretch
  end





  def self.run
    #this needs to loop
    @workout = []
    while @workout.length < 2
      display_muscle_groups
      display_relevant_stretches
      compile_workout
    end
    puts "end "
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
