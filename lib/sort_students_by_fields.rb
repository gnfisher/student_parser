require "students"

class SortStudentsByFields
  ALLOWED_FIELDS = :first_name,
                   :last_name,
                   :campus,
                   :favorite_color,
                   :date_of_birth

  def self.run(students, fields)
    verify_fields(fields)
    sort_orders = build_sort(fields)
    students.sort do |a,b|
      eval("#{sort_orders[0]} <=> #{sort_orders[1]}")
    end
  end

  private

  def self.build_sort(fields)
    sort_commands = fields.
      reduce(Hash.new { |h,k| h[k] = [] }) do |command, (field,order)|
        if order == :asc
          command[:left]  << "a.#{field}"
          command[:right] << "b.#{field}"
        else
          command[:left]  << "b.#{field}"
          command[:right] << "a.#{field}"
        end

        command
      end
    sort_commands.values.map{ |c| "[#{c.join(", ")}]" }
  end

  def self.verify_fields(fields)
    fields.keys.each do |field|
      unless ALLOWED_FIELDS.include? field.to_sym
        raise NoFieldOnRecordError.new(field)
      end
    end
  end

  class NoFieldOnRecordError < StandardError
    attr :field

    def initialize(field)
      msg = "No field found!"
      msg =+ %{ There is no "#{field}" on a student record.} if field
      super(msg)
    end
  end
end
