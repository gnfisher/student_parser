require "student_viewer_cli"

describe StudentViewerCLI do
  context "takes a folder of txt file and outputs student records" do
    it "sorted by campus (ascending) and last_name (ascending)" do
      output = StringIO.new
      folder_path = "spec/fixtures/"

      result = StudentViewerCLI.new(input: folder_path, output: output).run

      expect(output.string).to include(sorted_by_campus_asc_last_name_asc)
    end

    it "sorted by date_of_birth (ascending)" do
      output = StringIO.new
      folder_path = "spec/fixtures/"

      result = StudentViewerCLI.new(input: folder_path, output: output).run

      expect(output.string).to include(sorted_by_dob_asc)
    end

    it "sorted by last_name (descending)" do
      output = StringIO.new
      folder_path = "spec/fixtures/"

      result = StudentViewerCLI.new(input: folder_path, output: output).run

      expect(output.string).to include(sorted_by_last_name_desc_result)
    end
  end

  def sorted_by_campus_asc_last_name_asc
    <<~HEREDOC
      Output 1:
      Calrissian Lando Cloud City 2/12/1920 Neon Blue
      Kenobi Obi-Wan Mos Eisley 2/3/1890 Neon Blue
      Skywalker Luke Mos Eisley 3/24/1990 Topaz
      Vader Darth Vader's Castle 1/1/1900 Black
    HEREDOC
  end

  def sorted_by_dob_asc
    <<~HEREDOC
      Output 2:
      Kenobi Obi-Wan Mos Eisley 2/3/1890 Neon Blue
      Vader Darth Vader's Castle 1/1/1900 Black
      Calrissian Lando Cloud City 2/12/1920 Neon Blue
      Skywalker Luke Mos Eisley 3/24/1990 Topaz
    HEREDOC
  end

  def sorted_by_last_name_desc_result
    <<~HEREDOC
      Output 3:
      Vader Darth Vader's Castle 1/1/1900 Black
      Skywalker Luke Mos Eisley 3/24/1990 Topaz
      Kenobi Obi-Wan Mos Eisley 2/3/1890 Neon Blue
      Calrissian Lando Cloud City 2/12/1920 Neon Blue
    HEREDOC
  end
end
