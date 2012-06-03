require 'spec_helper'

load_homework_method('hw1', 'hw1_3.rb')

describe 'anagrams' do
  before do
    @anagrams = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
  end

  it 'should combine anagrams into groups' do
    result = [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]].map{|x| x.sort}.sort
    Object.send(:combine_anagrams, @anagrams).must_equal result
  end

  it 'should treat single-character capital letters as equal' do
    anagram = ['A', 'a']
    Object.send(:combine_anagrams, anagram).must_equal [['A', 'a'].sort]
  end

  it 'should treat two identical words with different cases as the same, and preserve case in output' do
    anagram = ["HeLLo", "hello"]
    Object.send(:combine_anagrams, anagram).must_equal [["HeLLo", "hello"]]
  end
end
