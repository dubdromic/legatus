class State
  def initialize(screen)
    @screen = screen
  end

  def update(input)
    fail NotImplementedError
  end

  def draw
    fail NotImplementedError
  end

  private

  attr_reader :screen
end
