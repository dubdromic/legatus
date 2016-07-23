class State
  def self.start(screen)
    new(screen).start
  end

  attr_reader :next

  def initialize(screen)
    @screen = screen
    @background_song = nil
    @next = self
  end

  def start
    play_background_music
    self
  end

  def stop
    stop_background_music
    self
  end

  def pause
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
  attr_writer :next

  def play_background_music
    background_music.play true
  end

  def stop_background_music
    background_music.stop
  end

  def background_music
    @background_music ||= background_song ? Gosu::Song.new(background_song) : NullSample.new
  end

  class NullSample
    def play; end
    def stop; end
  end
end
