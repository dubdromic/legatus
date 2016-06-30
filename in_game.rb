class InGame < State
  def initialize(screen)
    @player = Player.new screen
    @bullets = []
    @background = Gosu::Image.new('media/background.png', tileable: true)
    super screen
  end

  def update(input)
    bullets << player.fire if input.space?
    bullets.reject!(&:off_screen?)
    bullets.each(&:update)
    player.update input
    self
  end

  def draw
    background.draw_rot(background.height/2, background.width/2, 0, 90)
    player.draw
    bullets.each(&:draw)
  end

  private

  attr_reader :player, :bullets, :background
end
