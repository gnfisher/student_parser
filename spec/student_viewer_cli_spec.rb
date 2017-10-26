require "student_viewer_cli"

# Note to self: http://rspec.info/blog/2014/05/notable-changes-in-rspec-3/#new-output-matcher
# Use output() matcher
describe StudentViewerCLI do
  context "takes a folder of txt file and outputs student records" do
    it "sorted by campus (ascending) and last_name (ascending)"
    it "sorted by date_of_birth (ascending)"

    it "sorted by last_name (descending)" do
      output = StringIO.new
      folder_path = "spec/fixtures/"

      result = StudentViewerCLI.new(input: folder_path, output: output).run

      expect(result).to include(sorted_by_last_name_desc_result)
    end
  end

  def sorted_by_last_name_desc_result
    StringIO.new(
      "Output 3:
      Vader Darth Vader's Castle 1/1/1900 Black\n
      Skywalker Luke Mos Eisley 3/24/1990 Topaz\n
      Calrissian Lando Cloud City 2/12/1920 Neon Blue")
  end
end
