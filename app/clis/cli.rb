class Cli
  attr_accessor :current_user

  def initialize
    @current_user = nil
  end

  def self.welcome
  puts"
--------------------------------------------------------------------------------------------------

███╗   ██╗███████╗███████╗██████╗      █████╗     ██████╗ ██████╗ ███████╗ █████╗ ██╗  ██╗██████╗
████╗  ██║██╔════╝██╔════╝██╔══██╗    ██╔══██╗    ██╔══██╗██╔══██╗██╔════╝██╔══██╗██║ ██╔╝╚════██╗
██╔██╗ ██║█████╗  █████╗  ██║  ██║    ███████║    ██████╔╝██████╔╝█████╗  ███████║█████╔╝   ▄███╔╝
██║╚██╗██║██╔══╝  ██╔══╝  ██║  ██║    ██╔══██║    ██╔══██╗██╔══██╗██╔══╝  ██╔══██║██╔═██╗   ▀▀══╝
██║ ╚████║███████╗███████╗██████╔╝    ██║  ██║    ██████╔╝██║  ██║███████╗██║  ██║██║  ██╗  ██╗
╚═╝  ╚═══╝╚══════╝╚══════╝╚═════╝     ╚═╝  ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝  ╚═╝
"

 end

  def find_or_create_user
    puts "Enter your name to start:"
    name = nil
    while name == nil
      user_name = gets.chomp.downcase
      if user_name == "exit"
        exit
      else
        self.current_user = User.find_or_create_by(name: name)  #user instance
        name = user_name
      end
    end
  end

  def self.choose_mind_or_body
    puts " "
    puts "Choose MIND or BODY or EXIT"
    choice = nil
    while choice == nil
      user_input = gets.chomp.downcase
      if user_input == "mind"
        choice = user_input
        MeditationCli.run
      elsif user_input == "body"
        choice = user_input
        WorkoutCli.run
      elsif user_input == "exit"
        exit
      else
        puts "Choose MIND or BODY"
      end
    end
  end



  def self.run
    current_user = Cli.new
    welcome
    current_user.find_or_create_user
    choose_mind_or_body
  end

end
