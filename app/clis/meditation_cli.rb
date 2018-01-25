class MeditationCli

  def self.ask_how_much_time_does_user_have_in_sec
    puts " "
    puts "How many seconds would you like to meditate?"
  end

  def self.receive_and_convert_int_seconds
    numbers = "123456789"
    seconds = nil
    while seconds == nil
      user_time = gets.chomp.to_i
      if user_time.is_a?(Integer) && seconds == nil && user_time < 60
        seconds = user_time
      else
        puts "How many minutes would you like to meditate?"
      end
    end
      seconds
  end

  def self.breathe_in
    # 4 seconds
    put_out = "x"
    53.times do
      puts put_out
      sleep(0.080)
      put_out += "xx"
    end
  end

  def self.breathe_out
    put_out = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    53.times do
      puts put_out
      sleep(0.080)
      put_out.slice!(1)
      put_out.slice!(0)
    end
  end


  def self.breathe
    puts " "
    sleep(0.080)
    puts "INHALE"
    sleep(0.080)
    puts " "
    sleep(0.080)
    breathe_in
    puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    sleep(0.080)
    puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx EXHALE"
    sleep(0.080)
    puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    sleep(0.080)
    breathe_out
  end

  def self.countdown_to_med
    puts " "
    puts " "
        puts "---------------------------------------STARTING MEDITATION------------------------------------------"
    puts "3..."
    sleep 2
    puts "2..."
    sleep 2
    puts "1..."
    sleep 2
  end

  def self.run
    ask_how_much_time_does_user_have_in_sec
    seconds = receive_and_convert_int_seconds
    seconds = seconds / 8
    countdown_to_med
    seconds.times {MeditationCli.breathe}
    Cli.choose_mind_or_body
  end

end
