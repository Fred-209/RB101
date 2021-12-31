completed 12/29 in about half an hour
# Bubble Sort

# Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

# A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.
    
  
# **Rules/Requirements**

# *Input*: array

# *Output*: array (modified version of original


# *Explicit Requirements*: 
# - The given array most be sorted (bubble sort algorithm) in place
# - the array is considered sorted once a complete pass can be made over it without 
#   having to swap element places
# - when comparing 2 elements, if the first (operand on the left) is greater than the one 
#   on the right, swap their places


# *Implicit Requirements*: 
#  -


# *Questions:*

# *Edge Cases*:
# - 


# **Examples/Test Cases**
# ```ruby
# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# ```

# **Data Structure**
# Initial: array

# Intermediate: array

# Final: array



# **Algorithm**

# *High level thought process / brainstorming ideas
# - Iterate through the given aray. Compare the first two elements to see if the one on the left (first one) is greater than the one on the right. If so, swap their places
# . Then compare the next two elements (index 1 and 2 at this point), repeat this comparison and swap if needed. 
# - Do this all the way through the array until all elements in the array have been checked. 
# - repeat the above iteration until such a time that a complete iteration through all the elements happens and none have swapped places.
# - A toggle/flag variable would be useful for this tracking
# - could use cycle method on the collection for iteration, and a break condition at the end, or maybe just the `loop` method
# - maybe use `loop` method combined with the `exchanged_happened` toggle to know when to break out of the loop and stop iterating ove the collection
# - need 2 variables to track which items from the array are being compared
#   - one would be the iteration element, index of this element + 1
# - need to iterate over collection with index


# *Lower level steps of implementation*
# - 
# - start a `loop`
#   - init toggle variable `has_swapped` to false
#   - iterate over the given array from index 0 through -2 , with index `first_ele, idx`
#     - assign `second_ele` to the value found at the index in given array of idx+1
#     - if first_ele > second_ele 
#       - swap their places in the given array 
#         - given_array[idx], given_array[idx + 1] = given_array[idx + 1], given_array[idx]
#      - else - reassign `has_swapped` to true
#   - break out of loop if `has_swapped` is false
#   - return the given array (now modified)
    


# **Code Implementation**

def bubble_sort!(array)
  loop do 
    has_swapped = false
    
    array[0..-2].each_with_index do |first_ele, idx|
      second_ele = array[idx + 1]
      if first_ele > second_ele 
        array[idx], array[idx + 1] = array[idx + 1], array[idx]
        has_swapped ||= true
      end
    end
    break unless has_swapped
  end
end


array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)