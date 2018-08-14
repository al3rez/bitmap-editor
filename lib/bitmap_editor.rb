require "matrix"
require_relative "bitmap"

class BitmapEditor
  def initialize
    @table = nil
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      command, *args = line.chomp.split(" ")
      case command
      when "I"
        @table = Bitmap.new(*args)
      when "L"
        @table.paint!(*args)
      when "H"
        @table.paint_horizontally!(*args)
      when "V"
        @table.paint_vertically!(*args)
      when "C"
        @table.clear!
      when "S"
        @table.show!
      end
    end
  end
end
