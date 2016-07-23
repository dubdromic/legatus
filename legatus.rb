require 'gosu'
require 'require_all'

require_all 'components'
require_all 'entities'
require_all 'states'
require_all 'misc'

require './game'

class Window  < Gosu::Window
  WIDTH = 480
  HEIGHT = 640

  def self.half_width
    WIDTH / 2
  end

  def self.half_height
    HEIGHT / 2
  end

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
