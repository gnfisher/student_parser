require "forwardable"

class Students
  extend Forwardable
  def_delegators :@students, :each, :size

  def initialize(students)
    @students = students
  end

  def concat(students_to_merge)
    students.concat students_to_merge.students
  end

  def to_a
    students
  end

  protected

  attr_reader :students
end
