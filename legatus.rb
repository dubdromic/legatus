require 'gosu'
require './input'
require './state'
require './in_game'
require './main_menu'
require './entity'
require './screen'
require './player'
require './game'

class Window  < Gosu::Window
  WIDTH = 640
  HEIGHT = 480

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
