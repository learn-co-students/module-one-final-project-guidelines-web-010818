class Cli
  attr_accessor :current_user

  def initialize
    @current_user = nil
  end

  def welcome
    puts "Welcome."
    find_or_create_user
  end

  def find_or_create_user
    puts "Enter your name to start:"
    name = gets.chomp
    self.current_user = User.find_or_create_by(name: name.downcase)  #user instance
  end

  def choose_mind_or_body
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
    current_user = Cli.new
    current_user.welcome
    current_user.choose_mind_or_body
  end

end



  #meditation.rb
