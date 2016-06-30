class Enemy < Entity
  attr_accessor :physics

  def initialize(x, y)
    super(x, y, image.width, image.height)
  end

  def update
    physics.update(self, EnemyInput.new, screen)
  end

  def draw
    image.draw(x, y, 0)
  end

  def removable?
    x > screen.h || super
  end

  private

  attr_reader :image, :screen

  def image
    @image ||= Gosu::Image.new('media/enemy.png')
  end
end
