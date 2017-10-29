class PipeDelimitedLine
  KEYS = [
    :last_name,
    :first_name,
    :middle_initial,
    :campus,
    :favorite_color,
    :date_of_birth
  ]

  def initialize(line)
    @line = line
  end

  def parse
    Hash[KEYS.each_with_index.map { |k, i| [k, fields[i] ] }]
  end

  private

  def fields
    @line.split(/\|/).map(&:strip)
  end
end
