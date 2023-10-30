require_relative '../lib/tictactoe'
# require_relative '../lib/tic_tac_toe_gameplay'

describe Game do
  subject(:game_main) { described_class.new }
  # let(:player_one) { instance_double(Player, name: 'kyle', symbol: 'x') }

  describe '#initialize' do
    # Initialize -> No test necessary when only creating instance variables.
    # it 'updates board instance variable with selection' do
    #   result = " 1 | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 "
    #   expect(game_main.board).to eq(result)
    # end
  end

  describe '#print_board' do
    # Only contains puts statements -> No test necessary & can be private.
  end

  describe '#replace_number' do
    # Command Method -> Test the change in the observable state
    it 'updates board instance variable with selection' do
      board = " 1 | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 "
      updated_board = " x | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 "
      selection = '1'
      character = 'x'
      game_main.replace_number(board, selection, character)
      expect(game_main.instance_variable_get(:@board)).to eq(updated_board)
    end

    it 'updates board_array instance variable with selection' do
      board = " 1 | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 "
      updated_board_array = ['x', 2, 3, 4, 5, 6, 7, 8, 9]
      selection = '1'
      character = 'x'
      result = game_main.replace_number(board, selection, character)
      expect(result).to eq(updated_board_array)
    end
  end

  describe '#check_win' do
    context 'when a player has won' do
      it 'updates win instance variable' do
        character = 'x'
        game_main.board_array = ['x', 'x', 'x', 4, 5, 6, 7, 8, 9]
        game_main.check_win(character)
        expect(game_main.instance_variable_get(:@win)).to be true
      end

      it 'updates game_finished instance variable' do
        character = 'x'
        game_main.board_array = ['x', 'x', 'x', 4, 5, 6, 7, 8, 9]
        game_main.check_win(character)
        expect(game_main.instance_variable_get(:@game_finished)).to be true
      end
    end

    context 'when a player has not won' do
      it 'does not update win instance variable' do
        character = 'x'
        game_main.board_array = ['x', 'x', 3, 4, 5, 6, 7, 8, 9]
        game_main.check_win(character)
        expect(game_main.instance_variable_get(:@win)).to be false
      end

      it 'does not update game_finished instance variable' do
        character = 'x'
        game_main.board_array = ['x', 'x', 3, 4, 5, 6, 7, 8, 9]
        game_main.check_win(character)
        expect(game_main.instance_variable_get(:@game_finished)).to be false
      end
    end

    context 'when the game is a draw' do
      it 'updates game_finished instance variable' do
        character = 'x'
        game_main.board_array = %w[x x y y y x x y x]
        game_main.check_win(character)
        expect(game_main.instance_variable_get(:@game_finished)).to be true
      end

      it 'updates draw instance variable' do
        character = 'x'
        game_main.board_array = %w[x x y y y x x y x]
        game_main.check_win(character)
        expect(game_main.instance_variable_get(:@draw)).to be true
      end
    end
  end

  describe '#print_winner' do
    # Only contains puts statements -> No test necessary & can be private.
  end
end

describe Player do
  subject(:player_main) { described_class.new('kyle', 'x') }

  describe '#initialize' do
    # Initialize -> No test necessary when only creating instance variables.
  end

  describe '#print_symbol' do
    # Only retrieves instance variable (unnecessarily) -> No test necessary when only retreiving instance variables.
  end

  describe '#make_selection' do
    before do
      allow(player_main).to receive(:gets).and_return('a', '$', '3')
    end

    it 'loop ends when valid selection is made' do
      name = 'kyle'
      initial_prompt = "#{name}, choose a number on the board to make a move."
      retry_prompt = 'Please choose a valid selection from the remaining numbers on the board.'
      expect(player_main).to receive(:puts).with(initial_prompt).once
      expect(player_main).to receive(:puts).with(retry_prompt).twice
      player_main.make_selection(name)
    end
  end
end
