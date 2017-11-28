require 'gosu'
## Gosu::Window.new(200, 150); w.caption = "It works!"; w.show'
##  https://github.com/gosu/gosu/wiki/Getting-Started-on-OS-X

class Lifegame < Gosu::Window
  attr_reader :generation, :board, :x, :y

  ## 初期化処理
  ## 世代やボード、ボードの広さ(x,y)
  def initialize(x, y)
    Gosu::Color.argb(0xff_ffffff)
    @generation = 0
    @board = Board.new(x, y)
    @x = x
    @y = y
    @windows = super(x*10, y*10)
    @windows.caption = "Lifegame"
    @font = Gosu::Font.new(14)
    @img = Gosu::Image.new("./white.png", :tileable => true)
  end

  def lifegame!(cell_init)
    ## @img.draw(0, 0, 100)
    @windows.show()
    cell_init.times do
      cell = Cell.new(rand(@x), rand(@y))
      @board.cell_set(cell)
      @font.draw("*",cell.coodinate[:x]*5 , cell.coodinate[:y]*5, 100, 1, 1)
    end
    loop do
      p @Board.display
      next_gen!
      sleep 1
    end
  end

  def next_gen!
    @generation += 1
    cells.each do |key, cell|
      cell_next_gen!(cell)
    end
  end

  def cells
    @board.cells
  end

  def cell_next_gen!(cell)
    around_cell_count = 0
    x = cell.coodinate[:x]
    y = cell.coodinate[:y]

    around_cell_count += @board.cell_exist?(x+1,y) ? 1 : 0
    around_cell_count += @board.cell_exist?(x-1,y) ? 1 : 0
    around_cell_count += @board.cell_exist?(x,y+1) ? 1 : 0
    around_cell_count += @board.cell_exist?(x,y-1) ? 1 : 0
    around_cell_count += @board.cell_exist?(x+1,y+1) ? 1 : 0
    around_cell_count += @board.cell_exist?(x-1,y-1) ? 1 : 0
    around_cell_count += @board.cell_exist?(x-1,y+1) ? 1 : 0
    around_cell_count += @board.cell_exist?(x+1,y-1) ? 1 : 0

    if around_cell_count < 2
      ## cell is dead
    elsif around_cell_count <= 3
      ## cell is alive
      @board.cell_set(cell)
    else
      ## cell is dead
    end
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
    dead_or_alive!
  end

  def dead_or_alive!

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
    @cells[[x, y]] = cell
  end

end
