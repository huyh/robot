class Robot
  attr_reader :x, :y, :orientation

  def update_location(x: nil, y: nil, orientation: nil)
    @x = x
    @y = y
    @orientation = orientation
  end

  def placed?
    !(x.nil? || y.nil? || orientation.nil?)
  end
end
