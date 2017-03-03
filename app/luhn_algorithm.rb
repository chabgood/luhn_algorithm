require 'pry'

class LuhnAlgorthm

  attr_accessor :number, :digits, :check, :sum

  def initialize(number:)
    @number = number
    @digits = number.chars.map(&:to_i)
    @check = @digits.pop
  end

  def validate_number
    @sum = sum_digits
    is_number_valid?
  end

  private
    def sum_digits
      digits.reverse.each_slice(2).flat_map do |x, y|
        [(x * 2).divmod(10), y || 0]
      end.flatten.inject(:+)
    end

    def is_number_valid?
      check.zero? ? sum % 10 == 0 : (10 - sum % 10) == check
    end
end
