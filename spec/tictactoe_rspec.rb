require_relative '../lib/tictactoe'
# rspec spec/14_find_number_spec.rb

describe Game do
  describe '#initialize' do
    # Initialize -> No test necessary when only creating instance variables.
  end

  describe '#print_board' do
    # Only contains puts statements -> No test necessary & can be private.
  end

  describe '#replace_number' do
    # TODO
    # Command Method -> Test the change in the observable state
    subject(:game_main) { described_class.new }
    let(:player_one) { instance_double(Player, name: 'kyle', symbol: 'x') }

    before do
      allow(@board_array).to receive(:map!)
    end

    it 'updates board instance variable' do
      board = game_main.instance_variable_get(:@board)
      selection = 1
      character = player_one.instance_variable_get(:@symbol)
      new_board = " x | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 "
      expect(game_main.board).to eq(new_board)
      game_main.replace_number(board, selection, character)
    end
  end

  describe '#check_win' do
    # TODO
  end

  describe '#print_winner' do
    # Only contains puts statements -> No test necessary & can be private.
  end
end

describe Player do
  describe '#initialize' do
    # Initialize -> No test necessary when only creating instance variables.
  end

  describe '#print_symbol' do
    # Only retrieves instance variable (unnecessarily) -> No test necessary when only retreiving instance variables.
  end

  describe '#make_selection' do
    # TODO
  end
end
