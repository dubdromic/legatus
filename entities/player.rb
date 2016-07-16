class Player < Entity
  attr_accessor :physics

  def initialize(screen)
    @physics = PlayerPhysics.new
    @image = PlayerGraphics.new.image
    @screen = screen
    @last_bullet_time = Gosu::milliseconds
    @sound = PlayerSound.new.sound
    @sound.play
    super(
      screen.half_width - image.width/2,
      screen.h - (image.height + 40),
      image.width,
      image.height
    )
  end

  def update(input)
    pool.add(fire) if input.space?
    physics.update(self, input, screen)
  end

  def draw
    image.draw(x, y, 0)
  end

  def fire
    return NullBullet.new unless can_fire?
    @last_bullet_time = Gosu::milliseconds
    Bullet.new(x + half_width, y)
  end

  private

  attr_reader :image, :screen, :last_bullet_time

  def can_fire?
    Gosu::milliseconds - last_bullet_time > 150
  end
end
