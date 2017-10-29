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

    result = Student.new(attributes).to_s

    expect(result).to include("1/1/1900")
  end

  it "filters out unsafe keys" do
    attributes = {
      first_name: "Leia",
      last_name: "Organa",
      campus: "Alderaan",
      date_of_birth: "1-1-1900",
      favorite_color: "Blue",
      bad_key: "bad key data"
    }

    result = Student.new(attributes)

    expect(result).not_to respond_to(:bad_key)
  end

  it "converts NY, SF, and LA to full length city names" do
    student_one   = { campus: "NYC" }
    student_two   = { campus: "LA" }
    student_three = { campus: "SF" }

    expect(Student.new(student_one).campus).to eq "New York City"
    expect(Student.new(student_two).campus).to eq "Los Angeles"
    expect(Student.new(student_three).campus).to eq "San Francisco"

  end

  it "prints out itself as a properly formatted string" do
    student = Student.new(
      last_name: "Vader",
      first_name: "Darth",
      campus: "Mustafar",
      favorite_color: "Black",
      date_of_birth: "1-1-1900"
    )

    result = student.to_s

    expect(result).to eq("Vader Darth Mustafar 1/1/1900 Black")
  end
end
