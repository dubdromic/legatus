class AxisAlignedCollision
  def self.check(one, two)
    one.x < two.x + two.w &&
      one.x + one.w > two.x &&
      one.y < two.y + two.h &&
      one.h + one.y > two.y
  end
end
