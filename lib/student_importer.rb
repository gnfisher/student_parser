require "students"
require "student"

class StudentImporter
  def initialize(parser:, student_class: Student)
    @parser        = parser
    @student_class = student_class
  end

  def import
    rows.reduce(Students.new) do |students, attributes|
      students << student_class.new(attributes)
    end
  end

  def rows
    parser.rows
  end

  private

  attr_reader :parser, :student_class
end
