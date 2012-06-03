require 'spec_helper'

load_homework_class('hw1', 'hw1_5.rb')

describe Numeric do
  describe 'dollar conversion' do
    it 'default must be in dollars' do
      5.dollars.must_equal 5
    end

    it 'should convert dollars to euros' do
      5.dollars.in(:euros).must_equal 3.869969040247678
    end
  end

  describe 'euro conversion' do
    it 'should convert from dollars to euros' do
      5.euros.must_equal 6.46
    end

    it 'should convert euros to rupees' do
      5.euro.in(:rupees).must_equal 340
    end
  end

  it 'should convert from dollars to rupees' do
    5.rupees.must_equal 0.095
  end

  it 'should convert from dollars to yen' do
    5.yen.must_equal 0.065
  end
end
#
#
#module Enumerable
  #class SomeClass
  #end
#end

#describe String do
  #it 'should be able to call palindrome on an instance' do
    #"palindrome".palindrome?.must_equal false
    #"Madam, I'm Adam!".palindrome?.must_equal true
    #"A man, a plan, a canal -- Panama".palindrome?.must_equal true
  #end
#end

#describe Enumerable do
  #it 'should return if an Array is a palindrome' do
    #[1,2,3,4].palindrome?.must_equal false
    #[4,5,4].palindrome?.must_equal true
    #[1,2,3,2,1].palindrome?.must_equal true
  #end

  #it 'should return if a class that extends enumerable and has a reverse function is a palindrome' do
    #some_obj = SomeClass.new(["string","string2"])
    #puts some_obj.map{ |x| x }
    #some_obj.palindrome?.must_equal false

    #some_other_obj = SomeClass.new([1,2,3,2,1])
    #some_other_obj.palindrome?.must_equal true
  #end

  #it "should return nil if a class doesn't have a reverse function" do
    #{:hello => "1", :world => "2"}.palindrome?.must_equal nil
  #end
#end
