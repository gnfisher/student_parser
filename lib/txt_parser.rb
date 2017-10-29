require "comma_delimited_line"
require "dollar_delimited_line"
require "pipe_delimited_line"

class TXTParser
  attr_reader :file

  def initialize(file_path)
    @file = file_path
  end

  def rows
    File.readlines(file).map { |line| delimeter.new(line).parse }
  end

  private

  def delimeter
    case File.open(file, &:readline)
    when /,/
      CommaDelimitedLine
    when /\$/
      DollarDelimitedLine
    when /\|/
      PipeDelimitedLine
    else
      raise "Unrecognized delimiter used in #{file}."
    end
  end
end
