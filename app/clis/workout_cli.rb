class WorkoutCli
  attr_accessor :current_workout

  def initialize
    @current_workout = []
  end

  def choose_mg_id
    puts " "
    puts "Which muscle would you like to stretch?"
    MuscleGroup.display_all_mg
    users_choice = nil
    numbers = "12345678910"
    while users_choice == nil
      user_mg_id = gets.chomp
      if numbers.include?(user_mg_id)
        users_choice = user_mg_id.to_i
      else
        puts "Which muscle would you like to stretch?"
      end
    end
    users_choice
  end

  def choose_stretch_by_mg_id(mg_id)  #output stretch_id
    puts " "
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
    puts " "
    puts " "
    puts "---------------------------------------STARTING WORK OUT------------------------------------------"
    puts "3..."
    sleep 2
    puts "2..."
    sleep 2
    puts "1..."
    sleep 2
    puts "go!"
    sleep 2
    puts " "
  end

  def run_current_session
    self.current_workout.each do |stretch|
      puts "#{stretch.name.upcase}"
      stretch.display_stretch_picture
      puts "#{stretch.instructions}"
      sleep 5
      # sleep stretch.time_in_sec
      puts "-----------------------------------------GOOD JOB!----------------------------------------------"
      puts " "
    end
      puts "--------------------------------------END OF WORKOUT--------------------------------------------"
  end

  def star_favorite_stretch
    sleep 1
    puts " "
    puts "Which was your favorite stretch?"
    self.current_workout.each do |stretch|
      puts "#{stretch.id}. #{stretch.name}"
    end
    user_fav_stretch_id = gets.chomp.to_i
    Stretch.find_and_add_star_count_by_stretch_id(user_fav_stretch_id)
  end

  def self.run
    current_session = WorkoutCli.new
    while current_session.current_workout.length < 5
      user_input_mg_id = current_session.choose_mg_id
      user_input_stretch_id = current_session.choose_stretch_by_mg_id(user_input_mg_id)
      current_session.add_stretch_to_current_workout_by_stretch_id(user_input_stretch_id)
    end
    current_session.countdown
    current_session.run_current_session
    current_session.star_favorite_stretch
    Cli.choose_mind_or_body
  end

end
