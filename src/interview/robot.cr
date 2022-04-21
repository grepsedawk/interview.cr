class Interview::Robot
  property \
    direction : String,
    position : Array(Int32),
    obstacles : Hash(Array(Int32), Bool) = {} of Array(Int32) => Bool

  def initialize
    @direction = "north"
    @position = [0, 0]
    100.times do
      @obstacles[[rand(100), rand(100)]] = true
    end
  end

  def execute(command : String)
    case command
    when "L"
      turn_left
    when "R"
      turn_right
    when "M"
      move
    end

    puts "Robot at (#{@position[0]}, #{@position[1]}) facing #{@direction}"
  end

  def turn_left
    case direction
    when "north"
      self.direction = "west"
    when "west"
      self.direction = "south"
    when "south"
      self.direction = "east"
    when "east"
      self.direction = "north"
    end
  end

  def turn_right
    case direction
    when "north"
      self.direction = "east"
    when "east"
      self.direction = "south"
    when "south"
      self.direction = "west"
    when "west"
      self.direction = "north"
    end
  end

  def move
    case direction
    when "north"
      if collision_with(@position[0], @position[1] + 1)
        puts "Robot hit an obstacle"
      else
        self.position[1] += 1
      end
    when "east"
      if collision_with(@position[0] + 1, @position[1])
        puts "Robot hit an obstacle"
      else
        self.position[0] += 1
      end
    when "south"
      if collision_with(@position[0], @position[1] - 1)
        puts "Robot hit an obstacle"
      else
        self.position[1] -= 1
      end
    when "west"
      if collision_with(@position[0] - 1, @position[1])
        puts "Robot hit an obstacle"
      else
        self.position[0] -= 1
      end
    end
  end

  def collision_with(x : Int32, y : Int32)
    @obstacles.has_key?([x, y])
  end

  def help
    puts <<-HELP
            Command the robot with:
              L - turn left
              R - turn right
              M - move forward
              ? - this message
              Q - quit
            HELP
  end
end
