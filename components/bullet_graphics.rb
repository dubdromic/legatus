class BulletGraphics
  def image
    @@image ||= Gosu::Image.new('media/bullet.png')
  end
end
