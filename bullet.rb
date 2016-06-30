class Bullet < Entity
  def initialize(x, y, image)
    @image = image
    super(x, y, image.width, image.height)
  end

  def update(input = nil)
    @y -= 12
  end

  def draw
    image.draw(x, y, 0)
  end

  def removable?
    (y + h) < 0
  end

  private

  attr_reader :image
end
