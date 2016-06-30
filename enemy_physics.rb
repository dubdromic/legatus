class EnemyPhysics < Physics
  def update(entity, _, screen)
    @entity = entity
    @y_velocity = 1
    apply_velocity_to_entity
  end
end
