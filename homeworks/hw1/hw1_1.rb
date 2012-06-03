def palindrome?(string)
  orig = string.gsub(/\W*/,'').downcase
  orig == orig.reverse
end

def count_words(string)
  str = string.split(/\b\W*\b/i)
  h = Hash.new(0)
  str.each { |v| h[v.downcase] += 1 }
  h
end
