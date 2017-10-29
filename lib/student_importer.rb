require "students"
require "student"

class StudentImporter
  def initialize(parser)
    @parser = parser
  end

  def import
    rows.reduce(Students.new) do |students, attributes|
      students << Student.new(attributes)
    end
  end

  def rows
    parser.rows
  end

  private

  attr_reader :parser
end
