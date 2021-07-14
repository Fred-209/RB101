def reverse_words(string)
  words_arr = string.split

  words_arr.each do |word|
    if word.size >= 5
      words_arr[words_arr.index(word)] = word.reverse
    end
  end

    words_arr.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS