require "ostruct"
require "students"

class StudentImporter
  def initialize(parser)
    @parser = parser
  end

  def import
    rows.reduce(Students.new) do |students, attributes|
      students << OpenStruct.new(attributes)
    end
  end

  def rows
    @parser.rows
  end
end
