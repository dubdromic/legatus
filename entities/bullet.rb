class Bullet < Entity
  def initialize(x, y, team = Player::TEAM)
    @image = BulletGraphics.new.image
    @physics = BulletPhysics.new
    @sound = BulletSound.new.sound
    @sound.play
    @team = team
    super(x, y, image.width, image.height)
  end

  def update(input = nil)
    physics.update(self, input, screen)
  end

  def draw
    image.draw(x, y, 0)
  end

  def removable?
    y <= 0 || super
  end

  def before_removal
  end

  def hit!(other)
    remove! unless other.friendly?(self)
  end

  private

  attr_reader :image, :physics
end
