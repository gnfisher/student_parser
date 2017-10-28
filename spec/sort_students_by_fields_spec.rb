require "ostruct"
require "sort_students_by_fields"

describe SortStudentsByFields do
  it "raises an error if you try to sort by a nonexistant field" do
    students = Students.new(student_data)

    expect {
      SortStudentsByFields.run(students, bad_field: :desc)
    }.to raise_error SortStudentsByFields::NoFieldOnRecordError
  end

  it "can sort itself by a field desc" do
    students = Students.new(student_data)

    result = SortStudentsByFields.run(students, last_name: :desc)

    expect(result.first.last_name).to eq "Vader"
    expect(result.last.last_name).to eq "Fisher"
  end

  it "can sort itself by a field asc" do
    students = Students.new(student_data)

    result = SortStudentsByFields.run(students, last_name: :asc)

    expect(result.first.last_name).to eq "Fisher"
    expect(result.last.last_name).to eq "Vader"
  end

  it "can sort itself by multiple fields asc or desc" do
    students = Students.new(student_data)
    params = [students, {last_name: :desc, first_name: :asc}]

    result = SortStudentsByFields.run(*params)

    expect(result.first.last_name).to eq "Vader"
    expect(result.last.first_name).to eq "Greg"
  end

  def student_data
    [
      OpenStruct.new(first_name: "Greg", last_name: "Fisher"),
      OpenStruct.new(first_name: "Daniela", last_name: "Fisher"),
      OpenStruct.new(first_name: "Darth", last_name: "Vader")
    ]
  end
end
