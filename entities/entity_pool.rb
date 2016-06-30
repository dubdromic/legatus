class EntityPool
  attr_accessor :entities

  def initialize
    @entities = []
  end

  def update
    entities.each(&:update)
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
