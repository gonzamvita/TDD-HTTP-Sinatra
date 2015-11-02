require 'RSpec'

class StringCalculator
  def sum_digits numbers
    num_arr = numbers.gsub("\n", ",").split(",")
    num_arr.reduce(0) { |sum, item| sum.to_i + item.to_i }
  end
end

RSpec.describe "StringCalculator" do
  before :each do
    @calculator = StringCalculator.new
  end

  it "should return 0 for an empty string" do
    input = ""
    expect(@calculator.sum_digits(input)).to eq(0)
  end

  it "should return the digit for only one digit" do
    input = "2"
    expect(@calculator.sum_digits(input)).to eq(input.to_i)
  end

  it "should return the total for n digits in the string" do
    input = "1,2,3,4,5"
    expect(@calculator.sum_digits(input)).to eq(15)
  end

  it "should return the total for n digits even if they are separated by car returns" do
    input = "1\n1\n1\n1\n2"
    expect(@calculator.sum_digits(input)).to eq(6)
  end
end
