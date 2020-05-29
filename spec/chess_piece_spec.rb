require_relative "../classes/chess_piece"
require_relative "../classes/board"

describe Pawn do
  let(:board) { Board.new }

  context "white pieces" do
    it "creates a pawn piece" do
      pawn = Pawn.new(:white)
      expect(pawn.color).to eq(:white)
      expect(pawn.char).to eq(WHITE[:PAWN])
    end
    
    it "creates a rook piece" do
      rook = Rook.new(:white)
      expect(rook.color).to eq(:white)
      expect(rook.char).to eq(WHITE[:ROOK])
    end
  end

  context "black pieces" do
    it "creates a pawn piece" do
      pawn = Pawn.new(:black)
      expect(pawn.color).to eq(:black)
      expect(pawn.char).to eq(BLACK[:PAWN])
    end
    
    it "creates a rook piece" do
      rook = Rook.new(:black)
      expect(rook.color).to eq(:black)
      expect(rook.char).to eq(BLACK[:ROOK])
    end
  end
end

describe King do
  before(:each) do
    x = 3; y = 4
    @pos = [x, y]
    @board = Board.new(true)
    @king = King.new(:black)
    @board.board[4][3].piece = @king
  end

  describe "#check?" do
    context "returns false if" do
      it "is in check" do
        @board.board[3][3].piece = Pawn.new(:white)
        expect(@king.check?(@board.board, @pos)).to be_falsey
      end
    end

    context "returns true if" do
      after(:each) do 
        expect(@king.check?(@board.board, @pos)).to be_truthy
      end

      example "pawn checks king" do
        @board.board[3][4].piece = Pawn.new(:white)
      end
      
      example "bishop checks king" do
        @board.board[1][6].piece = Bishop.new(:white)
      end

      example "rook checks king" do
        @board.board[0][3].piece = Rook.new(:white)
      end

      example "knight checks king" do
        @board.board[6][2].piece = Knight.new(:white)
      end

      example "queen checks king" do
        @board.board[7][0].piece = Queen.new(:white)
      end
    end
  end
end