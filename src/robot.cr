require "./interview/robot"

robot = Interview::Robot.new

while true
  puts "Please enter a command:"
  command = gets.not_nil!.chomp

  case command
  when "Q"
    break
  when "?"
    puts robot.help
  else
    puts robot.execute command
  end
end
