require "student_importer"
require "students"
require "txt_parser"

class StudentViewerCLI
  def initialize(input:, output: $stdout)
    @file_path = input
    $stdout    = output
    @students  = import_students
  end

  def run
    puts "Output 1:"
    puts students.sort { |a,b|
      [a.campus, a.last_name] <=> [b.campus, b.last_name] }.to_s
    puts ""
    puts "Output 2:"
    puts students.sort { |a,b| a.date_of_birth <=> b.date_of_birth }.to_s
    puts ""
    puts "Output 3:"
    puts students.sort { |a,b| b.last_name <=> a.last_name }.to_s
  end

  private

  attr_reader :students, :file_path

  def import_students
    reduce_files_in_path do |imported_students, file|
      import_file_path = "#{file_path}/#{file}"
      parser = TXTParser.new(import_file_path)
      imported_students.merge(StudentImporter.new(parser: parser).import)
    end
  end

  def reduce_files_in_path(&block)
    Dir.foreach("#{file_path}").
      select { |f| f =~ /.txt/ }.
      reduce(Students.new, &block)
  end
end
