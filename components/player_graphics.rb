class PlayerGraphics
  def image
    @@image ||= Gosu::Image.new('media/player.png')
  end
end
