class Clock
  attr_accessor :hour, :minute

  def initialize(hour = 0, minute = 0)
    @hour = hour.to_i
    @minute = minute.to_i
    normalize
  end

  class << Clock
    alias_method :at, :new
  end

  def to_s
    sprintf("%02d:%02d", hour, minute)
  end

  def +(minutes_to_add)
    Clock.new(hour, minute + minutes_to_add)
  end

  def -(minutes_to_substract)
    Clock.new(hour, minute - minutes_to_substract)
  end

  def ==(other)
    self.in_minutes == other.in_minutes
  end

  def in_minutes
    hour * 60 + minute
  end

  private

  def normalize
    @hour = in_minutes / 60 % 24
    @minute = in_minutes % 60
  end
end
