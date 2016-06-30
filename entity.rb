class Entity
  attr_accessor :x, :y, :w, :h, :screen

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

  def collide?(other_entity)
    x.between?(other_entity.x..other_entity.w) &&
      y.between?(other_entity.y..other_entity.h)
  end
end
