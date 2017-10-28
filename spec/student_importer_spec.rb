require "student_importer"

describe StudentImporter do
  it "passes a file to a parser" do
    stub_parser do |parser_class, parser|
      StudentImporter.new(parser_class.new()).import

      expect(parser).to have_received(:rows)
    end
  end

  it "returns a Students object with objects for each hash" do
    stub_parser do |parser_class, parser|
      result = StudentImporter.new(parser_class.new()).import

      expect(result.class).to eq Students
      expect(result.size).to eq 2
      expect(result.first.class).to eq OpenStruct
    end
  end

  def stub_parser(&block)
    parser_class    = class_double("Parser")
    parser_instance = instance_double("parser")
    allow(parser_class).to receive(:new).
      and_return(parser_instance)
    allow(parser_instance).to receive(:rows).
      and_return([{name: "GreG"}, {name: "Dani"}])
    yield(parser_class, parser_instance) if block_given?
  end
end
