class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  strategies = ["R", "P", "S"].map(&:downcase)

  raise WrongNumberOfPlayersError unless game.length == 2

  game.each do |player|
    player_name = player[0]
    player_move = player[1]

    raise NoSuchStrategyError unless strategies.include?(player_move.downcase)
  end

  player_1 = game[0]
  player_2 = game[1]

  p1_move = player_1[1].downcase
  p2_move = player_2[1].downcase

  if p1_move == p2_move ||
    p1_move == "r" && p2_move == "s" ||
    p1_move == "p" && p2_move == "r" ||
    p1_move == "s" && p2_move == "p"
    player_1
  elsif p2_move == "r" && p1_move == "s" ||
        p2_move == "p" && p1_move == "r" ||
        p2_move == "s" && p1_move == "p"
    player_2
  end
end

def rps_tournament_winner(game)
  if game.flatten.size == 4
    rps_game_winner(game)
  else
    tier = []
    tier << rps_tournament_winner(game[0])
    tier << rps_tournament_winner(game[1])
    rps_game_winner(tier)
  end
end
