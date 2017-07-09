require './spec_helper.rb'
require '../lifegame.rb'

describe Lifegame do

  before do
    @lg = Lifegame.new(1,1)
  end

  it 'Lifegameってclassだよ' do
    expect(Lifegame.to_s).to eq 'Lifegame'
  end

  it 'Lifeagameはgenerationという変数をもっているよ' do
    expect(@lg.generation).to eq 0
  end

  it 'Liffegameはその世界にいるCellの数を把握しているよ' do
    expect(@lg.cells.count).to eq 0
  end


  it 'Lifegameが1世代すすむ' do
    expect(@lg.generation).to eq 0
    @lg.next_gen!
    expect(@lg.generation).to eq 1
  end
end

describe Cell do
  it 'Cellは自分が生きているのか死んでいるのかしっている' do
    expect(Cell.new(true, 0 ,0).alive?).to eq true
  end

  it 'Cellは自分がどの座標にいるのかを知っている' do
    cell = Cell.new(true, 0, 0)
    expect(cell.coodinate).to eq ({x: 0, y: 0})
  end
end

describe Board do
  it 'ボードは横10縦10のマスを持ったボードである' do
    board = Board.new(10, 10)
    expect(board.x).to eq 10
    expect(board.y).to eq 10
  end

  it 'ボードの表示' do
    board = Board.new(2, 2)
    expect(board.display).to eq "00\n00\n"
  end

  it 'その座標に生きているCellがある' do
    expect(board.at_cell?(0, 0)).to eq false
  end

end

