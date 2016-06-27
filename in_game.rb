class InGame < State
  def initialize(screen)
    @player = Player.new screen
    super screen
  end

  def update(input)
    player.update input
    self
  end

  def draw
    player.draw
  end

  private

  attr_reader :player
end
