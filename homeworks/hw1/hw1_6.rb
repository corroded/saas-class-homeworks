class CartesianProduct
  include Enumerable

  attr_accessor :product

  def initialize(arg1, arg2)
    @product = []
    arg1.each do |arg|
      arg2.each do |x|
	@product << [arg, x]
      end
    end
    @product
  end

  def each(&block)
    @product.each(&block)
  end
end
