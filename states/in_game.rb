class InGame < State
  def initialize(screen)
    @entity_pool = EntityPool.new
    @last_enemy_time = Gosu::milliseconds
    entity_pool.add Player.new(screen)
    super screen
  end

  def update(input)
    background.update
    add_new_enemy if spawn_enemy?
    entity_pool.update input
    end_game if player_killed?
    self
  end

  def draw
    background.draw
    entity_pool.draw
  end

  private

  attr_reader :entity_pool, :background, :last_enemy_time

  def end_game
    @next = GameOver.start screen
  end

  def player_killed?
    !entity_pool.entities.any? { |e| e.is_a?(Player) }
  end

  def add_new_enemy
    @last_enemy_time = Gosu::milliseconds
    entity_pool.add EnemyFactory.build(screen)
  end

  def spawn_enemy?
    Gosu::milliseconds - last_enemy_time > 1000
  end

  def background_song
    "media/flyin_and_a_killin.wav"
  end

  def background_image
    @background_image ||= BackgroundImage.image
  end

  def background
    @background ||= Background.new background_image
  end
end
