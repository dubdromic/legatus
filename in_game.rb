class InGame < State
  def initialize(screen)
    @player = Player.new screen
    @entity_pool = EntityPool.new
    @background = Gosu::Image.new('media/background.png', tileable: true)
    @last_enemy_time = Gosu::milliseconds
    setup_player
    super screen
  end

  def update(input)
    if spawn_enemy?
      @last_enemy_time = Gosu::milliseconds
      entity_pool.add EnemyFactory.build(screen)
    end

    entity_pool.add player.fire if input.space?
    entity_pool.update
    player.update input

    self
  end

  def draw
    background.draw_rot(background.height/2, background.width/2, 0, 90)
    player.draw
    entity_pool.draw
  end

  private

  attr_reader :player, :entity_pool, :background, :last_enemy_time

  def setup_player
    player.physics = PlayerPhysics.new
  end

  def spawn_enemy?
    Gosu::milliseconds - last_enemy_time > 500
  end
end
