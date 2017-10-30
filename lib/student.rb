require "date"

class Student
  ALLOWED_ATTRIBUTES = [
    :first_name,
    :last_name,
    :campus,
    :favorite_color,
    :date_of_birth
  ]

  attr_accessor :first_name,
                :last_name,
                :middle_initial,
                :campus,
                :favorite_color,
                :date_of_birth

  def initialize(attributes)
    @attributes = attributes
    set_attributes
  end

  def campus=(campus)
    @campus = full_city_names[campus] || campus
  end

  def date_of_birth=(dob_string)
    @date_of_birth = Date.strptime(dob_string, "%m-%d-%Y")
  end

  def to_s
    str = "#{last_name} #{first_name} #{campus} "\
          "#{date_of_birth.strftime('%-m/%-d/%Y')} #{favorite_color}"
  end

  private

  attr_reader :attributes

  def safe_keys
    ALLOWED_ATTRIBUTES & attributes.keys
  end

  def set_attributes
    safe_keys.each do |a|
      public_send("#{a}=", attributes.fetch(a))
    end
  end

  def full_city_names
    {
      "NYC" => "New York City",
      "LA"  => "Los Angeles",
      "SF"  => "San Francisco"
    }
  end
end
