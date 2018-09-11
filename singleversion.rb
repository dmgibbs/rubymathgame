# Non Class based version attempt at the game

p1score = 3
p2score = 3
winner = ""
loser = ""
winner_exists = false
game_ended = false



while  !game_ended
  val1 = rand(1..20);
  val2 = rand(1..20);
  puts "------------ NEW TURN -----------------"
  puts "Player1 : What does #{val1}  plus #{val2} equal ? "
  resp1 = gets.chomp.to_i
  answer = val1 + val2
  if resp1.to_i != answer
    puts " Seriously Player1 , No!"
    p1score -= 1
  end
  puts " P1: #{p1score}/3    P2: #{p2score}/3"
  val1 = rand(1..20);
  val2 = rand(1..20);
  puts "------------ NEW TURN -----------------"
  puts "Player2 : What does #{val1}  plus #{val2} equal ? "
  resp2 = gets.chomp.to_i
  answer = val1 + val2
  if resp2 != answer
    puts  " Seriously Player2 , No!"
    p2score -= 1
  end
  puts " P1: #{p1score}/3    P2: #{p2score}/3"
  
  if (p1score ==0 && p2score ==0)
    puts "No winner this time, we have a tie !!"
    winner_exists = false
  elsif (p1score == 0)
    game_ended = true
    loser = "P1"
    winner = "P2"
    winner_exists = true
    winscore = p2score 
  elsif p2score == 0
    game_ended = true
    loser = "P2"
    winner = "P1"
    winscore = p1score
    winner_exists = true
  end
end
if winner_exists == false
  puts "Game ends !  Winner is :  #{winner} with #{winscore}/3"
end


