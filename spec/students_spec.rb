require "ostruct"
require "students"

describe Students do
  it "concating students objects returns new students object" do
    students_one = Students.new(["s1"])
    students_two = Students.new(["s2"])

    result = students_one.merge(students_two)

    expect(result.class).to eq Students
    expect(result).to match_array(students_one)
    expect(result).to match_array(["s1", "s2"])
  end

  it "can merge elements into its inner array and return itself" do
    students = Students.new(["s1"])

    result = students << "s2"

    expect(result.class).to eq Students
    expect(result).to match_array(["s1", "s2"])
    expect(students).to match_array(result)
  end

  it "can print out its students" do
    students = Students.new(student_data)

    result = students.to_s

  end

  def student_data
    [
      OpenStruct.new(
        last_name: "Vader",
        first_name: "Darth",
        campus: "Mustafar",
        favorite_color: "Black",
        date_of_bith: "1/1/1900"
      )
    ]
  end
end
