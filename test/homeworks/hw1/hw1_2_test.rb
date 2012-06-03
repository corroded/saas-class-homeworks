require 'spec_helper'

load_homework_method('hw1', 'hw1_2.rb')

describe 'rps_game_winner' do
  it "raises WrongNumberOfPlayersError given a game without exactly 2 players" do
    game_with_one_player = [ [ "Armando", "P" ] ]
    game_with_three_players = [ [ "Armando", "P" ], [ "Dave", "S" ], [ "Eumir", "S" ] ]

    # for now use send since rps_game_winner is private
    call_with_1_player = lambda {Object.send(:rps_game_winner, game_with_one_player)}
    call_with_3_players = lambda {Object.send(:rps_game_winner, game_with_three_players)}
    call_with_1_player.must_raise WrongNumberOfPlayersError
    call_with_3_players.must_raise WrongNumberOfPlayersError
  end

  it 'raises NoSuchStrategyError when given a strategy that is not defined' do
    game_with_fail_strategy = [ [ "Armando", "C" ], [ "Dave", "S" ] ]
    game_with_fail_strategy_2 = [ [ "Armando", "r" ], [ "Dave", "x" ] ]

    call_with_wrong_strat = lambda {Object.send(:rps_game_winner, game_with_fail_strategy)}
    call_with_wrong_strat_2 = lambda {Object.send(:rps_game_winner, game_with_fail_strategy_2)}
    call_with_wrong_strat.must_raise NoSuchStrategyError
    call_with_wrong_strat_2.must_raise NoSuchStrategyError
  end

  it 'should return the first player if they have the same moves' do
    game = [["Armando", "R"], ["Dave", "R"]]

    Object.send(:rps_game_winner, game).must_equal ["Armando", "R"]
  end

  describe 'Armando uses paper' do
    before do
      @p1 = ["Armando", "P"]
      @game = [@p1]
    end

    it 'should return Armando if Dave plays rock' do
      p2 = ["Dave", "R"]
      @game << p2
      Object.send(:rps_game_winner, @game).must_equal @p1
    end

    it 'should return Armando if Dave plays paper' do
      p2 = ["Dave", "P"]
      @game << p2
      Object.send(:rps_game_winner, @game).must_equal @p1
    end

    it 'should return Dave if Dave plays scissors' do
      p2 = ["Dave", "s"]
      @game << p2
      Object.send(:rps_game_winner, @game).must_equal p2
    end
  end

  describe 'Armando uses rock' do
    before do
      @p1 = ["Armando", "R"]
      @game = [@p1]
    end

    it 'should return Armando if Dave plays rock' do
      p2 = ["Dave", "R"]
      @game << p2
      Object.send(:rps_game_winner, @game).must_equal @p1
    end

    it 'should return Dave if Dave plays paper' do
      p2 = ["Dave", "P"]
      @game << p2
      Object.send(:rps_game_winner, @game).must_equal p2
    end

    it 'should return Armando if Dave plays scissors' do
      p2 = ["Dave", "s"]
      @game << p2
      Object.send(:rps_game_winner, @game).must_equal @p1
    end
  end

  describe 'Armando uses scissors' do
    before do
      @p1 = ["Armando", "s"]
      @game = [@p1]
    end

    it 'should return Dave if Dave plays rock' do
      p2 = ["Dave", "R"]
      @game << p2
      Object.send(:rps_game_winner, @game).must_equal p2
    end

    it 'should return Armando if Dave plays paper' do
      p2 = ["Dave", "P"]
      @game << p2
      Object.send(:rps_game_winner, @game).must_equal @p1
    end

    it 'should return Armando if Dave plays scissors' do
      p2 = ["Dave", "s"]
      @game << p2
      Object.send(:rps_game_winner, @game).must_equal @p1
    end
  end
end

describe 'rps_tournament_winner' do
  before do
    @tourney = [
      [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"], ["Michael", "S"] ],
      ],
      [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
      ]
    ]

    @tourney2 = [
      [
        [
          [ ["Mr Rock", "R"], ["Mr Scissors", "S"] ],
          [ ["Metal", "P"], ["Lizard", "R"] ]
        ],
        [
          [ ["Asshai", "s"], ["Muppet", "r"] ],
          [ ["Phone", "p"], ["Frog", "s"] ]
        ]
      ],
      [
        [
          [ ["Pewer", "s"], ["Crow", "p"] ],
          [ ["Raider", "s"], ["Lotus", "s"] ]
        ],
        [
          [ ["Shoes", "p"], ["Mac", "s"] ],
          [ ["USB", "s"], ["PC", "p"] ]
        ]
      ]
    ]
  end

  it 'Richard beats Allen and wins the tourney' do
    Object.send(:rps_tournament_winner, @tourney).must_equal ["Richard", "R"]
  end

  it '' do
    Object.send(:rps_tournament_winner, @tourney2).must_equal ["Pewer", "s"]
  end
end
