class Sort
  def initialize(collection, fields)
    @collection = collection
    @fields = fields
  end

  def execute
    collection.sort do |a,b|
      eval("#{sort_orders[0]} <=> #{sort_orders[1]}")
    end
  end

  private

  :attr_reader :collection, :fields

  def sort_orders
    build_sort_orders.values.map{ |c| "[#{c.join(", ")}]" }
  end

  def build_sort_orders
    fields.
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
  end

end
