# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M


# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.
    
  

# **Rules/Requirements**

# *Input*: string (wor)

# *Output*: boolean


# *Explicit Requirements*: 
# - Each 'block' can only be used once
# - If a block letter is used, that makes its partner letter unavailable
# -  Because of this , only words that don't require both letters from a block can be spelled


# *Implicit Requirements*: 
#  - letter casing doesn't matter based on test cases
# - 


# *Questions:*
    

# *Edge Cases*:
# - Need to account for discrepancies in letter casing between 
#   my 'blocks' of letters and the given string
#   - Since the example has the 'block' letters all uppercase, easiest solution is to 
#   upcase the given string before checking the block list for inclusion


# **Examples/Test Cases**
# ```ruby
# block_word?('BATCH') == true
# block_word?('BUTCH') == false
# block_word?('jest') == true
# ```

# **Data Structure**
      
# Initial: string

# Intermediate: 2d Array or hash
#     - could use 2-element sub-arrays to house the letter combinations
#     - also a hash with one letter as the key, the other as the value

# Final: boolean (return `true` or `false`)



# **Algorithm**

# *High level thought process / brainstorming ideas

# Create a 2D array to store the letter combinations to represent the blocks
#   - [B, O]
# Assign variable to the count of items in the 'block' array above '
# Break the given string into an array of characters. 
# Iterate over array of characters then for each char check to see if any of the subarrays in the array of 'blocks' includes the current character, UPCASED
# - If it does, delete this block from the array of blocks
#   - need to track index for this
#   - Would also need to break out of iteration for the 'block' array so as not to 
#     mutate an item while iterating over it 
# If the original block count - the current count of items in the block array is equal to the length of the given string, return true. otherwise return false
  

# *Lower level steps of implementation*

# - init `letter_blocks` to a 2D array of above listed element pairs
# - init `original_block_count` to the size of `blocks`

# - Iterate over the chars in the given string:
#   - Iterate over `letter_blocks` with index, `block`, `idx`
#     - if `block` includes current char UPCASED
#       - delete the element from `letter_blocks` found at current `idx`
#       - break out of iteration of `letter_blocks`
# - return `true` if original_block_count - the current count of elements in `letter_blocks` is equal to the length of the given string, return false otherwise


# **Code Implementation**


def block_word?(string)
  letter_blocks = [ ['B', 'O'], ['G', 'T'], ['V', 'I'], ['X', 'K'], ['R', 'E'], ['L', 'Y'], ['D', 'Q'], ['F', 'S'], ['Z', 'M'], ['C', 'P'], ['J', 'W'], ['N', 'A'], ['H', 'U'] ]

  original_block_count = letter_blocks.size
  
  string.each_char do |char|
    letter_blocks.each do  |block|
      if block.include?(char.upcase) 
        letter_blocks.delete(block)
        break
      end
    end
  end
  current_block_count = letter_blocks.size
  original_block_count - current_block_count == string.length
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
