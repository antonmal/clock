class Clock
  attr_accessor :hour, :minute

  def initialize(hour, minute = 0)
    @hour = hour
    @minute = minute
  end

  class << Clock
    alias_method :at, :new
  end

  def to_s
    sprintf("%02d:%02d", hour, minute)
  end

  def +(minutes_added)
    new_hour = hour + minutes_added / 60
    new_minute = minute + minutes_added % 60
    new_hour += 1 if new_minute >= 60
    new_hour = new_hour % 24
    new_minute = new_minute % 60
    Clock.new(new_hour, new_minute)
  end

  def -(minutes_substracted)
    new_hour = hour - minutes_substracted / 60
    new_minute = minute - minutes_substracted % 60
    new_hour -= 1 if new_minute < 0
    new_hour = new_hour % 24
    new_minute = new_minute % 60
    Clock.new(new_hour, new_minute)
  end

  def ==(other)
    self.hour == other.hour && self.minute == other.minute
  end
end
