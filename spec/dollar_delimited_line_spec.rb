require "dollar_delimited_line"

describe DollarDelimitedLine do
  it "converts $ delimited strings into a hash with proper keys" do
    str = "Nolan $ Rhiannon $ O $ LA $ 10-4-1974 $ Vivid Tangerine"

    result = DollarDelimitedLine.new(str).parse

    expect(result).to eq(student_hash)
  end

  def student_hash
    {
      last_name: "Nolan",
      first_name: "Rhiannon",
      middle_initial: "O",
      campus: "LA",
      date_of_birth: "10-4-1974",
      favorite_color: "Vivid Tangerine"
    }
  end
end
