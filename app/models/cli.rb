class Cli< ActiveRecord::Base

  @@current_user = nil
  

  def self.greet_user
    #create welcome screen
    puts "hello"
  end

  def self.username
    puts "Enter your name"
    gets.chomp.downcase
  end

  def self.find_or_create_user
    @@current_user =  User.find_or_create_by(name: username)
  end
  #how to make this stop outputing SQL stuff


  def self.choose_mind_or_body
    puts "Choose MIND or BODY"
    choice = nil
    while choice == nil
      user_input = gets.chomp.downcase
      if user_input == "mind"
        choice = user_input
        # Meditation.run
      elsif user_input == "body"
        choice = user_input
        WorkoutCli.run
      else
        puts "Choose MIND or BODY"
      end
    end
  end


  def self.run
    greet_user
    find_or_create_user
    choose_mind_or_body
  end

end



  #meditation.rb
