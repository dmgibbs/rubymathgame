require "./player.rb"
class Game

  def initialize
    @player1 = Player.new ("P1");
    @player2 = Player.new("P2");
    @current_player = @player1
    @operator="plus"

  end

  #@val1,  @val2, @answer=

  def players
    [ @player1,@player2]
  end
  #@operations = ["+",'-','/']

  def find_winner
    players.select { |p| p.numlives !=0 }.first
  end

  def game_ended?
    players.any? {|p|p.numlives == 0 }
  end

  def is_mathOK?(response)

    @val1 = rand(1..20);
    @val2 = rand(1..20);
    answer = @val1 + @val2
    return response.to_i == answer
  end


  def get_target(current_player)
    if current_player == @player1
      @player2
    else
      @player1
    end
  end

  def question_answeredOK?
    
    @operator = "plus"
    @val1 = rand(1..20)
    @val2 = rand(1..20)
    puts " #{@current_player.name} what is #{@val1} #{@operator} #{@val2} equal ?"
    ans = gets.chomp.to_i
    puts("This was entered : #{ans}")
    if (@val1 +@val2) == ans
      return true
      puts "good answer!"
    else 
      return false
    end
  end

  def play
    while  !game_ended?
      target = get_target(@current_player)
      if !question_answeredOK? 
        puts "Seriously  #{@current_player.name} ,? No!"
       @current_player.lose_life
      end
      puts "#{@player1.name}: #{@player1.numlives}/3  #{@player2.name}: #{@player2.numlives}/3" 
      if @current_player == @player1
        @current_player = @player2
      else
        @current_player = @player1
      end
    end
    winner = find_winner
    puts " Congrats to #{winner.name} who has won the game !!"
  end 
end
