class DollarDelimitedLine
  KEYS = [
    :last_name,
    :first_name,
    :middle_initial,
    :campus,
    :date_of_birth,
    :favorite_color
  ]

  def initialize(line)
    @line = line
  end

  def parse
    Hash[KEYS.each_with_index.map { |k, i| [k, fields[i] ] }]
  end

  private

  def fields
    @line.split("$").map(&:strip)
  end
end
