require "comma_delimited_line"

describe CommaDelimitedLine do
  it "converts comma delimited strings into a hash with proper keys" do
    str = "Kirlin, Mckayla, Atlanta, Maroon, 5/29/1986"

    result = CommaDelimitedLine.new(str).parse

    expect(result).to eq(student_hash)
  end

  it "converts forward slash to dash in date_of_birth" do
    str = "Kirlin, Mckayla, Atlanta, Maroon, 5/29/1986"

    result = CommaDelimitedLine.new(str).parse

    expect(result[:date_of_birth]).to eq("5-29-1986")
  end

  def student_hash
    {
      last_name: "Kirlin",
      first_name: "Mckayla",
      campus: "Atlanta",
      favorite_color: "Maroon",
      date_of_birth: "5-29-1986"
    }
  end
end
