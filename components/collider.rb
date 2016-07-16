class Collider
  def initialize(entities)
    @entities = entities
  end

  def update
    collidable_entities.each do |entity|
      collidable_entities.each do |other|
        next if entity == other
        next unless AxisAlignedCollision.check(entity, other)
        entity.hit!(other)
        other.hit!(entity)
      end
    end
  end

  private

  attr_accessor :entities

  def collidable_entities
    entities.select(&:collidable?)
  end
end
