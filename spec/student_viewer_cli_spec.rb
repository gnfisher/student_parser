require "student_viewer_cli"

describe StudentViewerCLI do
  context "takes a folder of txt file and outputs student records" do
    it "sorted by campus (ascending) and last_name (ascending)"
    it "sorted by date_of_birth (ascending)"

    it "sorted by last_name (descending)" do
      output = StringIO.new
      folder_path = "spec/fixtures/"

      result = StudentViewerCLI.new(input: folder_path, output: output).run

      expect(output.string).to include(sorted_by_last_name_desc_result)
    end
  end

  def sorted_by_last_name_desc_result
      "Output 3:\nVader Darth Vader's Castle 1/1/1900 Black\nSkywalker Luke Mos Eisley 3/24/1990 Topaz\nCalrissian Lando Cloud City 2/12/1920 Neon Blue\n"
  end
end
