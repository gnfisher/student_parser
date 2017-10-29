require "txt_parser"

describe TXTParser do
  it "separates fields by comma, dollar sign, or pipe chars" do
    fixture_files.each do |file_path|

      result = TXTParser.new(file_path).rows.first

      expect(result.values.join("")).not_to match(/^(-|"|')\W/)
    end
  end

  def fixture_files
    Dir.foreach("spec/fixtures").
      reject { |f| f == "." || f == ".." }.
      map { |f| "spec/fixtures/#{f}" }
  end
end
