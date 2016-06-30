class Bullet < Entity
  def initialize(x, y)
    @image = BulletGraphics.new.image
    @physics = BulletPhysics.new
    super(x, y, image.width, image.height)
  end

  def update(input = nil)
    physics.update(self, input, screen)
  end

  def draw
    image.draw(x, y, 0)
  end

  def removable?
    (y + h) < 0 || super
  end

  private

  attr_reader :image, :physics
end
