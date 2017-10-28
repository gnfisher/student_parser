class TXTParser
  attr_reader :file

  def initialize(file_path)
    @file = file_path
  end

  def rows
    File.readlines(file).map do |line|
      values = line.split(/,|\$|\|/).map(&:strip)
      Hash[keys.each_with_index.map { |k, i| [k, values[i] ] }]
    end
  end

  def keys
    [
      :last_name,
      :first_name,
      :campus,
      :favorite_color,
      :date_of_birth
    ]
  end
end
