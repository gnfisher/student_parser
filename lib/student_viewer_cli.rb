class StudentViewerCLI
  def initialize(input:, output: $stdout)
    @file_path = input
    $stdout    = output
    @students  = import_students
  end

  def run
    puts "Output 3:"
    students.sort_by(:last_name, order_by: :desc).each(&:to_s)
  end

  private

  attr_reader :students

  def import_students
    reduce_files_in_path do |imported_students, file|
      import_file_path = "#{@file_path}/#{file}"
      parser = TXTParser.new(import_file_path)
      imported_students << StudentImporter.new(parser: parser).import
    end
  end

  def reduce_files_in_path(&block)
    Dir.foreach("#{@file_path}").
      select { |f| f =~ /.txt/ }.
      reduce(Students.new, &block)
  end
end
