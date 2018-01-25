class WorkoutCli
  attr_accessor :current_workout

  def initialize
    @current_workout = []
  end

  def choose_mg_id
    puts "Which muscle would you like to stretch?"
    MuscleGroup.display_all_mg
    user_mg_id = gets.chomp.to_i
  end

  def choose_stretch_by_mg_id(mg_id)  #output stretch_id
    puts "Which workout would you like to try?"
    relevant_stretches = Stretch.find_stretches_by_mg_id(mg_id)
    Stretch.display_stretches(relevant_stretches)
    user_stretch_id = gets.chomp.to_i
  end

  def add_stretch_to_current_workout_by_stretch_id(stretch_id)
    stretch = Stretch.find_stretch_by_id(stretch_id)
    self.current_workout << stretch
  end

  def countdown
    puts "Starting workout in"
    puts "3..."
    sleep 2
    puts "2..."
    sleep 2
    puts "1..."
    sleep 2
    puts "go!"
  end

  def run_current_session
    self.current_workout.each do |stretch|
      puts "#{stretch.name}"
      puts "#{stretch.instructions}"
      sleep 2
    end
  end

  def star_favorite_stretch
    puts "Which was your favorite stretch?"
    self.current_workout.each do |stretch|
      puts "#{stretch.id}. #{stretch.name}"
    end
    user_fav_stretch_id = gets.chomp.to_i
    Stretch.find_and_add_star_count_by_stretch_id(user_fav_stretch_id)
  end

  def self.run
    current_session = WorkoutCli.new
    while current_session.current_workout.length < 2
      user_input_mg_id = current_session.choose_mg_id
      user_input_stretch_id = current_session.choose_stretch_by_mg_id(user_input_mg_id)
      current_session.add_stretch_to_current_workout_by_stretch_id(user_input_stretch_id)
    end
    current_session.countdown
    current_session.run_current_session
    current_session.star_favorite_stretch
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
