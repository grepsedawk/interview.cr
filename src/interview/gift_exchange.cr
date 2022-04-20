require "csv"

class Interview::GiftExchange
  property \
    people : Array(Person) = [] of Person

  def initialize(csv : String)
    CSV.each_row(csv) do |row|
      @people << Person.new(
        name: row[0].strip,
        email: row[1].strip
      )
    end

    @people.shuffle!
  end

  def gifts
    @people.each_with_index.map do |person, index|
      person.gift(@people[index - 1])
    end
  end

  def print
    gifts.each do |gift|
      puts "#{gift.from.name} => #{gift.to.name}"
    end
  end

  record Person,
    name : String,
    email : String do
    def gift(to : Person)
      Gift.new(from: self, to: to)
    end
  end

  record Gift,
    from : Person,
    to : Person
end
