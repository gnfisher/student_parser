require "pry"
require "forwardable"
require "sort_students_by_fields"

class Students
  extend Forwardable
  def_delegators :@students, :each, :size, :first, :last, :sort_by, :sort

  def initialize(students = [])
    @students = students
  end

  def order(**fields)
    SortStudentsByFields.run(students, fields)
  end

  def concat(students_to_merge)
    students.concat students_to_merge.students
    self
  end

  def <<(element)
    students << element
    self
  end

  def to_a
    students
  end

  protected

  attr_reader :students
end
