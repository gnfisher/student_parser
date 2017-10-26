class StudentImporter
  def initialize(parser:)
    @parser = parser
  end

  def import
    @parser.rows
  end
end
