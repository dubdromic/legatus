class BackgroundImage
  def self.image
    @@image ||= Gosu::Image.new('media/background.png', tileable: true)
  end
end
