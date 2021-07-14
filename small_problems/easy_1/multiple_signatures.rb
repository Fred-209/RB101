# What do each of these puts statements output?

a = %w(a b c d e)
puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }

# The first puts raises an IndexError because an index value of 7 is out of range
# for this array.
# The second puts will print out 'beats me' and return nil, because when Array#fetch
# is given a second argument, its the default value that gets used if the index
# argument is out of range.
# The third puts will print out 49 and return nil. This occurrs because when the 
# Array#fetch method is given an index argument and a block, it first tries to 
# return the element in the array at this index. If unable to, as in this case 
# because 7 is not an index value in range for the array, then the block gets executed.
# In this case, this block uses the index 7 that was given as the object being 
# worked on, so 7**2 is 49.
