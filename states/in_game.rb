class InGame < State
  BACKGROUND_X = BackgroundImage.image.height / 2

  def initialize(screen)
    @entity_pool = EntityPool.new
    @last_enemy_time = Gosu::milliseconds
    entity_pool.add Player.new(screen)

    @backgroundDelta = 1

    @backgroundY_start = background_image.height / 2
    @backgroundY_end = screen.h * 1.5

    @background1 = background_image 
    @background2 = background_image

    @background1Y = @backgroundY_start
    @background2Y = -(@backgroundY_start * 2)

    super screen
  end

  def update(input)
    add_new_enemy if spawn_enemy?
    entity_pool.update input
    end_game if player_killed?
    self
  end

  def draw
    move_background
    entity_pool.draw
  end

  private

  attr_reader :entity_pool, :background, :last_enemy_time,:backgroundY_start, :backgroundY_end, :backgroundDelta
  attr_accessor :background1, :background2

  def move_background
    @background1Y += @backgroundDelta
    @background2Y += @backgroundDelta

    @background1Y = background_image_reset?(@background1Y) ? -(@backgroundY_start * 2) : @background1Y + @backgroundDelta
    @background2Y = background_image_reset?(@background2Y) ? -(@backgroundY_start * 2) : @background2Y + @backgroundDelta

    @background1.draw_rot(BACKGROUND_X, @background1Y, 0, 90)
    @background2.draw_rot(BACKGROUND_X, @background2Y, 0, 90)
  end

  def background_image_reset?(y)
    y > @backgroundY_end
  end

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
end
