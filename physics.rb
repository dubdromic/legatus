class Physics
  def initialize
    @x_velocity = 0
    @y_velocity = 0
  end

  def update(entity, input, screen)
    fail NotImplementedError
  end

  private

  attr_accessor :entity
  attr_reader :x_velocity, :y_velocity

  def apply_velocity_to_entity
    entity.x += x_velocity
    entity.y += y_velocity
  end

  def bind_to_box(box)
    entity.x -= x_velocity if within_height_of_box?(entity, box)
    entity.y -= y_velocity if within_width_of_box?(entity, box)
  end

  def within_height_of_box?(object, box)
    object.x < box.x || (object.x + object.w) > box.w
  end

  def within_width_of_box?(object, box)
    object.y < box.y || (object.y + object.h) > box.h
  end
end
