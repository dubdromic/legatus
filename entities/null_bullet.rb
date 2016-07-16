class NullBullet
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
end
