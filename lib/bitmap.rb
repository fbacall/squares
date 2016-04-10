require 'base64'

class Bitmap

# C D
# A B

  BITMAP_TEMPLATE = %w(
42 4d 46 00 00 00 00 00  00 00 36 00 00 00 28 00
00 00 02 00 00 00 02 00  00 00 01 00 18 00 00 00
00 00 10 00 00 00 00 00  00 00 00 00 00 00 00 00
00 00 00 00 00 00 AB AG  AR BB BG BR 00 00 CB CG
CR DB DG DR 00 00
)

  OFFSETS = [62, 65, 54, 57]

  attr_reader :bitmap

  # Generates a 2x2 bitmap image from an array of 4 hex colours
  # example: Bitmap.new('00FF00','0000FF','FF00FF','FF0000')
  def initialize(*args)
    raise "Need 4 arguments" unless args.length == 4
    bitmap = BITMAP_TEMPLATE.dup
    args.each_with_index do |colour, index|
      bitmap[OFFSETS[index]+2] = colour[0..1] # R
      bitmap[OFFSETS[index]+1] = colour[2..3] # G
      bitmap[OFFSETS[index]]   = colour[4..5] # B
    end
    @bitmap = bitmap.map(&:hex).pack('C*')
  end

  def data_uri
    "data:image/bmp;base64,#{Base64.strict_encode64(@bitmap)}"
  end
end
