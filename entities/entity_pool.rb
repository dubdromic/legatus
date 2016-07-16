class EntityPool
  attr_accessor :entities

  def initialize
    @entities = []
  end

  def update(input)
    Collider.new(entities).update
    entities.each { |e| e.update(input) }
    entities.select(&:removable?).map(&:before_removal)
    entities.reject!(&:removable?)
  end

  def draw
    entities.each(&:draw)
  end

  def add(entity)
    entity.pool = self
    entities << entity
  end
end
