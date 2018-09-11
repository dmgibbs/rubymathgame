class Player

attr_accessor :name , :numlives

  def initialize(name, numlives = 3)
    @name = name
    @numlives = numlives
  end


  def game_lost?
    @numlives = 0
  end

  def lose_life
    @numlives -= 1
  end

  def  summary
    return "#{name}: #{@numlives}/3 "

  end
end