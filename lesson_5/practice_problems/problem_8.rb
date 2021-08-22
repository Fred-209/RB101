# Practice Problem 8

# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = 'aeiou'

hsh.each do |key, value|
  value.each do |word|
    word.each_char do |letter|
      print letter if VOWELS.include?(letter)
    end
  end
end



