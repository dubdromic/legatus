class Entity
  attr_accessor :x, :y, :w, :h, :screen, :pool, :mark_for_removal

  def initialize(x, y, w, h)
    @x = x
    @y = y
    @w = w
    @h = h
    @mark_for_removal = false
  end

  def half_width
    w / 2
  end

  def half_height
    h / 2
  end

  def remove!
    @mark_for_removal = true
  end

  def removable?
    mark_for_removal
  end
end
