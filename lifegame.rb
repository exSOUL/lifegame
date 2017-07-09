class Lifegame
  attr_reader :generation, :board

  def initialize(x, y)
    @generation = 0
    @board = Board.new(x, y)
  end

  def lifegame!(cell_init)
    cell_init.times do
    end
    loop do
      next_gen!
      @Board.display
      sleep 1
    end
  end

  def next_gen!
    @generation += 1
    cells.each do |cell|
      cell.next_gen!
    end
  end

  def cells
    @board.cells
  end

end

class Cell
  attr_reader :life, :coodinate

  def initialize(life = true, x, y)
    @life = true
    @coodinate = {x: x, y: y}
  end

  def alive?
    @life
  end

  def next_gen!

  end

end

class Board
  attr_reader :x, :y, :cells

  def initialize(x,y)
    @x = y
    @y = y

    @cells = {}
  end

  def display
    @cells.each do |address, cell|
      p address
      p cell.alive?
    end
  end

  def cell_exist?(x, y)
    !@cells[[x, y]].nil?
  end

  def cell_set(cell)
    @cells[[cell.x, cell.y]] = cell
  end

end
