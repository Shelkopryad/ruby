require_relative 'class'
require 'rspec'

RSpec.describe TestClass do
  it "should to equal 25" do
    expect(TestClass.new.multyply(5)).to eq 25
  end
  
  it "should not to equal 3" do
    expect(TestClass.new.multyply(1)).to_not eq 3
  end
  
end