class BackgroundImage
  def self.image
    @@image ||= Gosu::Image.new('media/background.png', tileable: true)
  end

  def self.pause_image
    @@background_image ||= Gosu::Image.new('media/pause_background.png')
  end
end
