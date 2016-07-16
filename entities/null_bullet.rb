class NullBullet < Entity
  def initialize(*)
  end

  def update(_ = nil)
  end

  def draw
  end

  def before_removal; end

  def removable?
    true
  end

  def pool=(_)
  end

  def collidable?
    false
  end
end
