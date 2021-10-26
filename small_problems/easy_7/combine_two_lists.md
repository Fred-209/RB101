# Combine Two Lists

Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

**Rules/Requirements**

_Input_: 2 arrays
_Output_:  single array

_Explicit_:
- Both input arrays are non-empty
- both input arrays have the same number of elements
- The returned array should consist of alternating elements from both arrays

_Implicit_:
- The array given as the first argument will start the alternation:
  - It's element at position 0 should be the element at position 0 of the returned array

_Questions:_


**Examples/Test Cases**

```ruby
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
```

**Data Structure**
Input: 2 arrays - [1, 2, 3], [4, 5, 6]
Output: 1 array [1, 4, 2, 5, 3, 6]

**Algorithm**
- Create an empty array `interleaved_array`
- Loop next section until the given first array is empty
  - Remove first element of array_1 and add to `interleaved_array`
  - Remove the first element of array_2 and add to `interleaved_array`
- return `interleaved_array
**Code Implementation**

```ruby
def interleave(array_1, array_2)
  interleaved_array = []

  until array_1.empty?
    interleaved_array << array_1.shift
    interleaved_array << array_2.shift
  end
  interleaved_array
end
```

