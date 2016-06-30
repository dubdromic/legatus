class EnemyFactory
  def self.build(screen)
    random_x = rand(screen.x..screen.w)
    enemy = Enemy.new(random_x, -40)
    enemy.screen = screen
    enemy.physics = EnemyPhysics.new
    enemy
  end
end
