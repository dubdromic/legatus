class Player < Entity
  STOP_SPEED = 0.6
  MAX_VELOCITY = 7
  VELOCITY_MODIFIER = 0.9

  def initialize(screen)
    @x_velocity = 0
    @y_velocity = 0
    @image = Gosu::Image.new('media/player.png')
    @screen = screen
    super(0, 0, image.width, image.height)
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

  private

  attr_reader :image, :screen

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
