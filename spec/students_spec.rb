require "students"
require "pry"

describe Students do
  it "can merge with another students object" do
    students_one = Students.new(["s1"])
    students_two = Students.new(["s2"])

    students_one.concat students_two

    expect(students_one.size).to eq 2
    expect(students_one.to_a).to match_array(["s1", "s2"])
  end
end
