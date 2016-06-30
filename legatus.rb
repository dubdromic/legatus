require 'gosu'
require './input'
require './state'
require './in_game'
require './main_menu'
require './entity_pool'
require './entity'
require './screen'
require './bullet'
require './null_bullet'
require './physics'
require './player_physics'
require './player'
require './enemy_physics'
require './enemy_input'
require './enemy'
require './enemy_factory'
require './game'

class Window  < Gosu::Window
  WIDTH = 480
  HEIGHT = 640

  def initialize
    super(WIDTH, HEIGHT)
    self.caption = 'Legatus'
  end

  def update
    input.update
    game.update input
    close if game.exit?
  end

  def draw
    game.draw
  end

  private

  attr_reader :input, :game

  def input
    @input ||= Input.new
  end

  def game
    @game ||= Game.new screen
  end

  def screen
    @screen ||= Screen.new(0, 0, WIDTH, HEIGHT)
  end
end

window = Window.new
window.show
