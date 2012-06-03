require 'spec_helper'

load_homework_class('hw1', 'hw1_6.rb')

describe CartesianProduct do
  it 'should return the cartesian product of 2 arrays as an iterator' do
    c = CartesianProduct.new([:a,:b], [4,5])
    c.first.must_be_instance_of Array

    cc = CartesianProduct.new([:a,:b], [])
    cc.first.must_equal nil
  end
end
