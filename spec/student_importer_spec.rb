require "student_importer"

describe StudentImporter do
  it "imports a file and passes it to a parser" do
    parser       = spy("parser")
    parser_class = class_double("Parser")
    allow(parser_class).to receive(:new).and_return(parser)

    StudentImporter.new(parser: parser_class.new()).import

    expect(parser).to have_received(:rows)
  end
end
