require "matrix"

# Monkey patch Matrix class to be able to assign
# values to nested elements.
class Matrix
  def set(i,j,k)
    @rows[i][j] = k
  end
end

class Bitmap
  attr_reader :table

  def initialize(m, n)
    @m = m.to_i
    @n = n.to_i
    @table = build
  end

  def build
    Matrix.build(@n, @m) { |row, col| "O" }
  end

  def show!
    return if @table.nil?
    str = ""
    @table.to_a.each do |row|
      str += row.join("")
      str += "\n"
    end
    puts str
  end

  def clear!
    return if @table.nil?
    @table = build
  end

  def paint!(x, y, c)
    return if @table.nil?
    offset = -1
    @table.set(y.to_i+offset, x.to_i+offset, c)
  end

  def paint_vertically!(x, y1, y2, c)
    return if @table.nil?
    [*y1...y2].each{ |y| self.paint!(x,y,c) }
  end

  def paint_horizontally!(x1, x2, y, c)
    return if @table.nil?
    [*x1...x2].each{ |x| self.paint!(x,y,c)}
  end
end
