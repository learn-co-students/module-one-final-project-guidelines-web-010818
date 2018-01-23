class Cli < ActiveRecord::Base

  def self.run

  end

  #greet user
  #get user's name
  #how much time do you have (in minutes) *** CHANGE TABLE
    #input = free_time
  #mind_body_or_both
    #if mind -> meditation
    #elsif body -> workout
    #elsif -> both
    #else -> end

  #meditation.rb

  #workout.rb
    #1) ask_body_part
      #if body_part -> while input != start routine || time <= free_time
                    #-> show relevant poses
                    #-> select stretch(es)
                    #-> save stretch to routine
                    #-> time += stretch.time
      #else -> fullbody

    #2) launch routine
    #3) ask for favorite pose(s)
      # +=1 to star_count(s)


end
