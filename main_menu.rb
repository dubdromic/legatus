class MainMenu < State
  def initialize(screen)
    @title_font = Gosu::Font.new 40
    @description_font = Gosu::Font.new 20
    super screen
  end

  def update(input)
    return InGame.new(screen) if input.space?
    self
  end

  def draw
    title_font.draw("Legatus", 200, 200, 1)
    description_font.draw('Press Spacebar', 200, 255, 1)
  end

  private

  attr_reader :title_font, :description_font
end
