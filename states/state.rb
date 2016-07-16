class State
  def initialize(screen)
    @screen = screen
    @background_song = nil
  end

  def start
    play_background_music
    self
  end

  def stop
    stop_background_music
    self
  end

  def update(input)
    fail NotImplementedError
  end

  def draw
    fail NotImplementedError
  end

  private

  attr_reader :screen

  def play_background_music
    @background_music = background_music.play(1, 1, true)
  end

  def stop_background_music
    background_music.stop
  end

  def background_music
    @background_music ||= background_song ? Gosu::Sample.new(background_song) : NullSample.new
  end

  class NullSample
    def play; end
    def stop; end
  end
end
