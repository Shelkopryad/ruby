require_relative 'class'
require 'rspec'

RSpec.configure do |c|
  c.dry_run = true
end

RSpec.describe Calculator do
  # positive
  it "should to equal 10" do
    expect(Calculator.new.sum(4,6)).to eq 10
  end
  
  it "should to equal 15" do
    expect(Calculator.new.multyply(3, 5)).to eq 15
  end

  it "should to equal 10" do
    expect(Calculator.new.substract(15,5)).to eq 10
  end

  it "should to equal 3" do
    expect(Calculator.new.divide(18,6)).to eq 3
  end

  # negative
  it "should not to equal 10" do
    expect(Calculator.new.sum(4,7)).to_not eq 10
  end
  
  it "should not to equal 15" do
    expect(Calculator.new.multyply(3, 9)).to_not eq 15
  end

  it "should not to equal 10" do
    expect(Calculator.new.substract(15,6)).to_not eq 10
  end

  it "should not to equal 3" do
    expect(Calculator.new.divide(18,78)).to_not eq 3
  end

  it "tests exception" do
    expect(Calculator.new.divide(4,0)).to eq "Divide by zero"
  end
  
end