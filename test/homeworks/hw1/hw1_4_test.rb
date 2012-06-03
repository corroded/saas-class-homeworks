require 'spec_helper'

load_homework_class('hw1', 'hw1_4.rb')

describe Dessert do
  before do
    @fruit_salad = Dessert.new("Fruit salad", 150)
    @ice_cream = Dessert.new("Ice cream", 300)
  end

  it 'should return its name' do
    @fruit_salad.name.must_equal "Fruit salad"
    @ice_cream.name.must_equal "Ice cream"
  end

  it 'should return its calories' do
    @fruit_salad.calories.must_equal 150
    @ice_cream.calories.must_equal 300
  end

  it 'should always be delicious' do
    @fruit_salad.delicious?.must_equal true
    @ice_cream.delicious?.must_equal true
  end

  describe 'healthy' do
    it 'should return true if calories are less than 200' do
      @fruit_salad.healthy?.must_equal true
    end
    it 'should return false if calories are greater than 200' do
      @ice_cream.healthy?.must_equal false
    end
  end

end

describe JellyBean do
  before do
    @red_jellybean = JellyBean.new("Red Jelly Bean", 10, "atzuki")
    @black_licorice = JellyBean.new("black licorice", 20, "black licorice")
  end

  it 'should return its flavor' do
    @red_jellybean.flavor.must_equal "atzuki"
    @black_licorice.flavor.must_equal "black licorice"
  end

  it 'should not be delicious if it is black licorice' do
    @red_jellybean.delicious?.must_equal true
    @black_licorice.delicious?.must_equal false
  end
end

