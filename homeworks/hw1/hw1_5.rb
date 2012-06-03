class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}=(attr_val)
        @#{attr_name}_history ||= [nil]
        @#{attr_name}_history << attr_val
      end
    }
  end
end

class Numeric
  @@currencies = {
    'yen'    => 0.013,
    'euro'   => 1.292,
    'rupee'  => 0.019,
    'dollar' => 1
  }
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)
    singular_currency = currency.to_s.gsub( /s$/, '')
    self / @@currencies[singular_currency] if @@currencies.has_key?(singular_currency)
  end
end

class String
  def palindrome?
    orig = self.gsub(/\W*/,'').downcase
    orig == orig.reverse
  end
end

module Enumerable
  def palindrome?
    self.map{ |x| x } == self.map{ |x| x }.reverse if self.respond_to?(:each)
  end
end
