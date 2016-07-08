class InGame < State
  def initialize(screen)
    @player = Player.new screen
    @entity_pool = EntityPool.new
    @last_enemy_time = Gosu::milliseconds
    @flyin_and_a_killin = Gosu::Sample.new("media/flyin_and_a_killin.wav")
    @flyin_and_a_killin.play(1, 1, true)
    super screen
  end

  def update(input)
    if spawn_enemy?
      @last_enemy_time = Gosu::milliseconds
      entity_pool.add EnemyFactory.build(screen)
    end

    entity_pool.add(player.fire) if input.space?
    entity_pool.update
    player.update input

    self
  end

  def draw
    background_image.draw_rot(background_image.height/2, background_image.width/2, 0, 90)
    player.draw
    entity_pool.draw
  end

  private

  attr_reader :player, :entity_pool, :background, :last_enemy_time

  def spawn_enemy?
    Gosu::milliseconds - last_enemy_time > 500
  end

  def background_image
    @background_image ||= BackgroundImage.image
  end
end
