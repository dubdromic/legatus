class InGame < State
  def initialize(screen)
    @player = Player.new screen
    @bullets = []
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
    player.draw
    bullets.each(&:draw)
  end

  private

  attr_reader :player, :bullets
end
