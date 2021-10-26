require 'pry'
# def interleave!(array_1, array_2)
#   interleaved_array = []

#   until array_1.empty?
#     interleaved_array << array_1.shift
#     interleaved_array << array_2.shift
#   end
#   interleaved_array
# end

# p interleave!([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

  #One liner
# def interleave(array_1, array_2)
#   array_1.zip(array_2).flatten
# end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

#with counter, non destructive

# def interleave(array_1, array_2)
#   interleaved_array = []
  
#   counter = 0
#   until counter == array_1.size
#     interleaved_array << array_1[counter]
#     interleaved_array << array_2[counter]
#     counter += 1
#   end
#   interleaved_array
# end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

#using a toggle variable

def interleave(array_1, array_2)
  toggle_on = false
  combined_array = array_1 + array_2

  combined_array.map.with_index do |_, index|
    toggle_on = !toggle_on
    toggle_on ? array_1[index / 2] : array_2[index / 2]
  end
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
