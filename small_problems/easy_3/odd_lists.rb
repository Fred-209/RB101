# Odd Lists

# Write a method that returns an Array that contains every other element of an  `Array`  that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

def oddities(array)
  odd_elements = array.select do |element|
    array.index(element).even?
  end
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []


# Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.

def evenies(array)
  even_elements = array.select do |element|
    array.index(element).odd?
  end
end

p evenies([2, 3, 4, 5, 6]) == [3, 5]
p evenies([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evenies(['abc', 'def']) == ['def']
p evenies([123]) == []
p evenies([]) == []


# Try to solve this exercise in at least 2 additional ways.

puts "Using a manual until loop"
def oddities(array)
  odd_elements = []
  index = 0

  until index >= array.size
    odd_elements << array[index]
    index += 2
  end

  odd_elements
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

puts "Using .map, modulo, and #Array.compact"

def oddities(array)
  odd_elements =  array.map do |element|
    element if array.index(element) % 2 == 0
  end
  odd_elements.compact
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
