class AxisAlignedCollision
  def self.check(one, two)
    (one.x - two.x).abs * 2 < (one.w + two.w) &&
      (one.y - two.y).abs * 2 < (one.h + two.h)
  end
end
