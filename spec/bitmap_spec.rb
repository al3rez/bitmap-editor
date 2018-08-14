require "spec_helper"

describe "Bitmap" do
  describe "#new" do
    it "creates a new table filled with O" do
      bitmap = Bitmap.new(5, 5)
      expect(bitmap.table).to eq(Matrix.build(5, 5) { |row, col| "O" })
    end

    context "when bitmaps doesn't start at coordinates 1,1" do
      it "raises an exception" do
        expect { Bitmap.new(0, 1) }.to raise_exception(ArgumentError)
      end
    end

    context "when pixel coordinates are not between 1 and 250" do
      it "raises an exception" do
        expect { Bitmap.new(300, 300) }.to raise_exception(ArgumentError)
      end
    end
  end

  describe "#paint!" do
    it "paints the pixel with the given color" do
      bitmap = Bitmap.new(5, 6)
      bitmap.paint!(1, 3, "A")
      expect(bitmap.table).to eq(Matrix[["O", "O", "O", "O", "O"],
                                        ["O", "O", "O", "O", "O"],
                                        ["A", "O", "O", "O", "O"],
                                        ["O", "O", "O", "O", "O"],
                                        ["O", "O", "O", "O", "O"],
                                        ["O", "O", "O", "O", "O"]])
    end
  end

  describe "#paint_vertically!" do
    it "paints the pixel with the given color vertically" do
      bitmap = Bitmap.new(5, 6)
      bitmap.paint_vertically!(2, 3, 6, "W")
      expect(bitmap.table).to eq(Matrix[["O", "O", "O", "O", "O"],
                                        ["O", "O", "O", "O", "O"],
                                        ["O", "W", "O", "O", "O"],
                                        ["O", "W", "O", "O", "O"],
                                        ["O", "W", "O", "O", "O"],
                                        ["O", "O", "O", "O", "O"]])
    end
  end

  describe "#paint_horizontally!" do
    it "paints the pixel with the given color vertically" do
      bitmap = Bitmap.new(5, 6)
      bitmap.paint_horizontally!(3, 5, 2, "Z")
      expect(bitmap.table).to eq(Matrix[["O", "O", "O", "O", "O"],
                                        ["O", "O", "Z", "Z", "O"],
                                        ["O", "O", "O", "O", "O"],
                                        ["O", "O", "O", "O", "O"],
                                        ["O", "O", "O", "O", "O"],
                                        ["O", "O", "O", "O", "O"]])
    end
  end

  describe "#clear!" do
    it "clears all the paintings done to the table" do
      bitmap = Bitmap.new(5, 5)
      bitmap.paint!(5, 3, "A")
      bitmap.clear!
      expect(bitmap.table).to eq(Matrix.build(5, 5) { |row, col| "O" })
    end
  end
end
