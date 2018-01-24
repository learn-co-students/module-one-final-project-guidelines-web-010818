class Workout < ActiveRecord::Base
  has_many :workout_stretches
  has_many :stretches, through: :workout_stretches

  has_many :user_workouts
  has_many :users, through: :user_workouts


  def self.current_workout_id
    current_workout = self.where(name: "#{@@current_user}'s workout")
    current_workout.id
  end

  def self.find_workoutstretch_by_workout_id
    WorkoutStretch.where("workout_id = ?", current_workout_id)
  end

  def self.run_current_workout
    find_workoutstretch_by_workout_id.each do |workoutstretch|
      stretch = Stretch.find(workoutstretch.stretch_id)
      puts "#{stretch.name}"
      puts "#{stretch.instructions}"
      sleep 10
    end
  end
end
