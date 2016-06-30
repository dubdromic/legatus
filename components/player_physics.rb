class PlayerPhysics < Physics
  STOP_SPEED = 0.6
  MAX_VELOCITY = 7
  VELOCITY_MODIFIER = 0.9

  def update(player, input, screen)
    @entity = player
    @input = input

    process_input
    cap_velocity
    apply_velocity_to_entity
    bind_to_box screen
  end

  private

  attr_accessor :player, :input

  def process_input
    slow unless input.direction_pressed?
    move_left if input.left?
    move_right if input.right?
    move_up if input.up?
    move_down if input.down?
  end

  def slow
    @x_velocity += STOP_SPEED if @x_velocity < 0
    @x_velocity -= STOP_SPEED if @x_velocity > 0
    @x_velocity = 0 if @x_velocity.between?(-STOP_SPEED, STOP_SPEED)
    @y_velocity += STOP_SPEED if @y_velocity < 0
    @y_velocity -= STOP_SPEED if @y_velocity > 0
    @y_velocity = 0 if @y_velocity.between?(-STOP_SPEED, STOP_SPEED)
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
