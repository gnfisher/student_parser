class StudentViewerCLI
  MERGED_FILE_PATH = 'tmp/merged_data.txt'

  def initialize(input:, output: $stdout)
    @file_path = input
    $stdout = output
  end

  def run
    # pass each file to importer
    @students = load_students_from_file
    puts "Output 3:"
    @students.sort_by(:last_name, order_by: :desc).each(&:to_s)
  end

  def load_students_from_file
    build_merged_file
    StudentImporter.new(parser: TXTParser.new(MERGED_FILE_PATH))
  end

  # def delete_merged_file
  #   FileUtils.rm(MERGED_FILE_PATH)
  # end

  def build_merged_file
    File.open(MERGED_FILE_PATH, 'a') do |merged_file|
      Dir.foreach("#{@file_path}") do |f|
        next unless f =~ /.txt/
        merged_file << File.read("#{@file_path}/#{f}")
      end
    end
  end
end
