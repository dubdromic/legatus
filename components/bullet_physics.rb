class BulletPhysics < Physics
  def initialize
    @x_velocity = 0
    @y_velocity = -12
    @explosion = Gosu::Sample.new("media/explosion.wav")
  end

  def update(entity, _, _)
    @entity = entity
    apply_velocity_to_entity
    entity.pool && entity.pool.entities.each do |other|
      next if entity == other
      if other.is_a?(Enemy)
        if AxisAlignedCollision.check(entity, other)
          other.remove!
          entity.remove!
          @explosion.play
        end
      end
    end
  end
end
