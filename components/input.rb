class Input
  def initialize(klass = Gosu)
    @klass = klass
  end

  def update
  end

  def space?
    pushed? klass::KbSpace
  end

  def direction_pressed?
    up? || down? || left? || right?
  end

  def up?
    pushed? klass::KbUp
  end

  def down?
    pushed? klass::KbDown
  end

  def left?
    pushed? klass::KbLeft
  end

  def right?
    pushed? klass::KbRight
  end

  def exit?
    pushed? klass::KbEscape
  end

  private

  attr_reader :klass

  def pushed?(button)
    klass::button_down?(button)
  end
end
