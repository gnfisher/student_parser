require "txt_parser"

describe TXTParser do
  it "separates fields by comma, dollar sign, or pipe chars" do
    file_path = "spec/fixtures/sample_students.txt"

    result = TXTParser.new(file_path).rows.first

    expect(result.values.join("")).not_to match(/^(-|"|')\W/)
  end
end
