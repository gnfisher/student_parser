require "pipe_delimited_line"

describe PipeDelimitedLine do
  it "converts | delimited strings into a hash with proper keys" do
    str = "Goyette | Timmothy | E | London | Pacific Blue | 10-2-1964"

    result = PipeDelimitedLine.new(str).parse

    expect(result).to eq(student_hash)
  end

  def student_hash
    {
      last_name: "Goyette",
      first_name: "Timmothy",
      middle_initial: "E",
      campus: "London",
      favorite_color: "Pacific Blue",
      date_of_birth: "10-2-1964"
    }
  end
end
