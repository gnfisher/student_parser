require "forwardable"

class Students
  extend Forwardable
  def_delegators :@students, :each, :size, :first, :last, :sort_by, :sort

  def initialize(students = [])
    @students = students
  end

  def merge(students_to_merge)
    students.concat(students_to_merge.students)
    self
  end

  def sort(&block)
    Students.new(students.sort(&block))
  end

  def <<(element)
    students << element
    self
  end

  def to_a
    students
  end

  def to_s
    students.map(&:to_s)
  end

  protected

  attr_reader :students
end
