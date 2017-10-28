require "ostruct"
require "students"

describe Students do
  it "can merge with another students object" do
    students_one = Students.new(["s1"])
    students_two = Students.new(["s2"])

    students_one.concat students_two

    expect(students_one.size).to eq 2
    expect(students_one.to_a).to match_array(["s1", "s2"])
  end

  it "can merge elements into its inner array and return itself" do
    students = Students.new(["s1"])

    result = students << "s2"

    expect(result.class).to eq Students
  end

  it "calls SortStudentsByFields when ordering students" do
    expect(SortStudentsByFields).to receive(:run)

    Students.new(["s1"]).order(first_name: :desc)
  end
end
