class BulletPhysics < Physics
  def initialize
    @x_velocity = 0
    @y_velocity = -12
  end

  def update(entity, _, _)
    @entity = entity
    apply_velocity_to_entity
  end
end
