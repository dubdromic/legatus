class MainMenu < State
  
  def initialize(screen)
    @title_font = Gosu::Font.new 40
    @description_font = Gosu::Font.new 20
    @background = Gosu::Image.new('media/background.png', tileable: true)
    super screen
  end

  def update(input)
    stop and return InGame.new(screen).start if input.space?
    self
  end

  def draw
    background.draw_rot(background.height/2, background.width/2, 0, 90)
    title_font.draw("Legatus", 150, 200, 1)
    description_font.draw('Press Spacebar', 150, 255, 1)
  end

  private

  attr_reader :title_font, :description_font, :background

  def background_song
    "media/intro.wav"
  end
end
