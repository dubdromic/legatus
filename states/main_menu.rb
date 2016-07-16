class MainMenu < State
  
  def initialize(screen)
    @title_font = Gosu::Font.new 40
    @description_font = Gosu::Font.new 20
    @background = Gosu::Image.new('media/background.png', tileable: true)
    @intro = Gosu::Sample.new("media/intro.wav")

    @intro.play(1, 1, true)
    super screen
  end

  def update(input)
    if input.space?
      #@intro.stop
      return InGame.new(screen) 
    end
    self
  end

  def draw
    background.draw_rot(background.height/2, background.width/2, 0, 90)
    title_font.draw("Legatus", 150, 200, 1)
    description_font.draw('Press Spacebar', 150, 255, 1)
  end

  private

  attr_reader :title_font, :description_font, :background
end
