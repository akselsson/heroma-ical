require_relative 'days_state'

class HeaderState

  def visit(text)
    case text
    when 'Tider'
      DaysState.new
    else
      self
    end
  end

end
