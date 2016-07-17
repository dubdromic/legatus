class Game
  def initialize(screen)
    @state = MainMenu.new(screen).start
  end

  def update(input)
    @input = input
    @state = state.update(input).next
  end

  def draw
    state.draw
  end

  def exit?
    input.exit?
  end

  private

  attr_reader :input, :state
end
