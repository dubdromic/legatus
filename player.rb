class Player < Entity
  STOP_SPEED = 0.6
  MAX_VELOCITY = 7
  VELOCITY_MODIFIER = 0.9

  def initialize(screen)
    @x_velocity = 0
    @y_velocity = 0
    @screen = screen
    @last_bullet_time = Gosu::milliseconds
    super(screen.half_width - image.width/2, screen.h - (image.height + 40), image.width, image.height)
  end

  def update(input)
    process_input input
    cap_velocity
    apply_velocity_to_position
    bound_to_screen
  end

  def draw
    image.draw(x, y, 0)
  end

  def fire
    return NullBullet.new unless can_fire?
    @last_bullet_time = Gosu::milliseconds
    Bullet.new(x + half_width, y, bullet_image)
  end

  private

  attr_reader :image, :screen, :last_bullet_time

  def can_fire?
    Gosu::milliseconds - last_bullet_time > 150
  end

  def image
    @image ||= Gosu::Image.new('media/player.png')
  end

  def bullet_image
    @bullet_image ||= Gosu::Image.new('media/bullet.png')
  end

  def bound_to_screen
    @x -= @x_velocity if x < 0 || (x + w) > screen.w
    @y -= @y_velocity if y < 0 || (y + h) > screen.h
  end

  def process_input(input)
    slow unless input.direction_pressed?
    move_left if input.left?
    move_right if input.right?
    move_up if input.up?
    move_down if input.down?
  end

  def apply_velocity_to_position
    @x += @x_velocity
    @y += @y_velocity
  end

  def slow
    @x_velocity += STOP_SPEED if @x_velocity < 0
    @x_velocity -= STOP_SPEED if @x_velocity > 0
    @x_velocity = 0 if @x_velocity.between?(-0.5, 0.5)
    @y_velocity += STOP_SPEED if @y_velocity < 0
    @y_velocity -= STOP_SPEED if @y_velocity > 0
    @y_velocity = 0 if @y_velocity.between?(-0.5, 0.5)
  end

  def move_left
    @x_velocity -= 1
  end

  def move_right
    @x_velocity += 1
  end

  def move_up
    @y_velocity -= 1
  end

  def move_down
    @y_velocity += 1
  end

  def cap_velocity
    @x_velocity *= VELOCITY_MODIFIER if too_fast_right? || too_fast_left?
    @y_velocity *= VELOCITY_MODIFIER if too_fast_up? || too_fast_down?
  end

  def too_fast_left?
    @x_velocity < -MAX_VELOCITY
  end

  def too_fast_right?
    @x_velocity > MAX_VELOCITY
  end

  def too_fast_up?
    @y_velocity < -MAX_VELOCITY
  end

  def too_fast_down?
    @y_velocity > MAX_VELOCITY
  end
end
