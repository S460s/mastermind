# frozen_string_literal: true

# Masterclass representing a player
class Player
  def initialize(name)
    @name = name
  end

  def to_s
    @name
  end
end
