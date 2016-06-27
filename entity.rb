class Entity
  attr_reader :x, :y, :w, :h

  def initialize(x, y, w, h)
    @x = x
    @y = y
    @w = w
    @h = h
  end

  def half_width
    w / 2
  end

  def half_height
    h / 2
  end
end
