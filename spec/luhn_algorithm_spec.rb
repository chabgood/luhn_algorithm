require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../app/luhn_algorithm.rb'


describe LuhnAlgorthm do
  context "valid" do
    valid_digit = '79927398713'
    it "should return true for #{valid_digit}" do
      valid_number = LuhnAlgorthm.new(number: valid_digit)
      expect(valid_number.validate_number).to be_truthy
    end
  end

  context "invalid" do
    invalid_digits = ['79927398710', '79927398714']

    invalid_digits.each do |number|
      it "should return false for #{number}" do
        invalid_number = LuhnAlgorthm.new(number: number)
        expect(invalid_number.validate_number).to_not be_truthy
      end
    end
  end
end
