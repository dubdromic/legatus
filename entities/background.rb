class Background
  def initialize(image)
    @image = image
    @delta = 2
    @y_coordinates = [0, -image.height]
  end

  def update
    y_coordinates.each_with_index do |coordinate, i|
      y_coordinates[i] = coordinate > image.height ? -image.height : coordinate + delta
    end
  end

  def draw
    y_coordinates.each do |coordinate|
      image.draw(0, coordinate, 0)
    end
  end

  private

  attr_reader :image, :delta, :y_coordinates
end
