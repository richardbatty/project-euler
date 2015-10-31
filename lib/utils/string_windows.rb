class Substrings

  def initialize(string)
    @string = string
  end

  def of_length(length)
    no_of_windows = @string.length - length
    [*0..no_of_windows].map do |window_start|
      @string.slice(window_start, length)
    end
  end

end
