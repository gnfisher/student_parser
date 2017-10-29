require "student"

describe Student do
  it "converts date string to Date object" do
    attributes = {
      first_name: "Leia",
      last_name: "Organa",
      campus: "Alderaan",
      date_of_birth: "1-1-1900",
      favorite_color: "Blue"
    }
    converted_date = Date.strptime('1-1-1900', '%m-%d-%Y')

    result = Student.new(attributes).date_of_birth

    expect(result.class).to eq Date
    expect(result).to eq converted_date
  end

  it "formats the date M/D/YEAR" do
    attributes = {
      first_name: "Leia",
      last_name: "Organa",
      campus: "Alderaan",
      date_of_birth: "1-1-1900",
      favorite_color: "Blue"
    }

    result = Student.new(attributes).date_of_birth
  end
end
