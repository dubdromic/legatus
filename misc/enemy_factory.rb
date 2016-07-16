class EnemyFactory
  def self.build(screen)
    random_range = (screen.x + 10)..(screen.w - 10)
    random_x = rand random_range
    random_y = rand(-100..-40)
    enemy = Enemy.new(random_x, random_y)
    enemy.x = rand(random_range) while enemy.x > (screen.w - 10 - enemy.w)
    enemy.screen = screen
    enemy.physics = EnemyPhysics.new
    enemy
  end
end
