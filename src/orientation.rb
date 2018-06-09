class Orientation
  NORTH = 'NORTH'
  EAST  = 'EAST'
  SOUTH = 'SOUTH'
  WEST  = 'WEST'

  VALID_ORIENTATIONS = [NORTH, EAST, SOUTH, WEST]

  class << self
    def valid?(orientation)
      VALID_ORIENTATIONS.include?(orientation)
    end

    def right_of(orientation)
      return unless valid?(orientation)
      VALID_ORIENTATIONS[(index_of(orientation) + 1) % VALID_ORIENTATIONS.size]
    end

    def left_of(orientation)
      return unless valid?(orientation)
      VALID_ORIENTATIONS[(index_of(orientation) - 1) % VALID_ORIENTATIONS.size]
    end

    private
      def index_of(orientation)
        VALID_ORIENTATIONS.index(orientation)
      end
  end
end
