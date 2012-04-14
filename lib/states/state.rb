module State
  def schedule
    @schedule ||= Schedule.new
  end
  def schedule=(schedule)
    @schedule = schedule
  end
end
