# Longest Sentence

# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

# Example text:
#   Four score and seven years ago our fathers brought forth
# on this continent a new nation, conceived in liberty, and
# dedicated to the proposition that all men are created
# equal.

# Now we are engaged in a great civil war, testing whether
# that nation, or any nation so conceived and so dedicated,
# can long endure. We are met on a great battlefield of that
# war. We have come to dedicate a portion of that field, as
# a final resting place for those who here gave their lives
# that that nation might live. It is altogether fitting and
# proper that we should do this.

# But, in a larger sense, we can not dedicate, we can not
# consecrate, we can not hallow this ground. The brave
# men, living and dead, who struggled here, have
# consecrated it, far above our poor power to add or
# detract. The world will little note, nor long remember
# what we say here, but it can never forget what they
# did here. It is for us the living, rather, to be dedicated
# here to the unfinished work which they who fought
# here have thus far so nobly advanced. It is rather for
# us to be here dedicated to the great task remaining
# before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# -- that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth.
    
 

# **Rules/Requirements**

# *Input*: a txt file (or block of text)

# *Output*:  a string (longest sentence), integer (number of 'words' in longest sentence)


# *Explicit Requirements*: 
# -read the contents of a text file
# - print out the longest sentence from the given text file based on words
# - Sentences may with with period, exclmation point, or a question mark.
# - Any sequence of chracters that is not a space or sentence ending character
#   should be treated as a word.
# - also print the  number of words in the longest sentence

# *Implicit Requirements*: 
#  -


# *Questions:*
# - what to print for an empty given text file?
# - what to print if there is no sentence-ending punctuation?
#   - no way to determine without further explanation
# - How to handle 2 sentences of equal length?
  
# *Edge Cases*:
# - 


# **Examples/Test Cases**
# ```ruby

# ```

# **Data Structure**
# Initial: text file 

# Intermediate: arrays of sentences, arrays of words

# Final: string and an integer (maybe interpolate the integer somewhere)



# **Algorithm**

# *High level thought process / brainstorming ideas

# - Assign the contents of the text file to a variable. 
#   - FIle.read saves this as a long string `text`
# - Split `text` up into an array of sentences, using '. ! and ?' as delimiters
#   - can use a regex for this
# - init a longest_sentence` variable to an empty string
# - Iterate over `sentences`
#   - init `words` to the result of splitting current sentence on whitespace
#   - if the number of elements in `words` is greater than the number of elements in        `longest_sentence` when splitting on whitespace, reassign `longest_sentence` to the current `sentence` in 

# - create a word_count variable that is the count of words in longest sentence
# print out `longest_sentence' to the screen
# print out longest_sentence and word count to the screen

# *Lower level steps of implementation*
# - Use File.read to assign variable `text` to the contents of a given file
# - init `longest_sentence` to an empty string
# - Using a regex pattern of /\.\!\?/, split `text` up based on that as the pattern, and save the
# results as `sentences`
# - Iterate over the `sentences` array, `sentence` parameter
#   - init `words` to result of calling `split` on `sentence` with whitespace as delimiter
#   - If the count of words in `words` is greater than the count of elements when splitting `longest_sentence`, reassign longest_sentence to be equal to `sentence`

# - assign word_count to result of splitting longest_sentence on whitespace and counting the elements of that
# - Print out longest_sentence 
# - print out word_count

# **Code Implementation**

text_file = File.read("four_score.txt")
def longest_sentence(text)
  longest_sentence = ''
  sentences = text.split(/\.|\?|!/)

  sentences = clean_sentences(sentences)

  sentences.each do |sentence|
    words = sentence.split
   if words.count > longest_sentence.split.count
      longest_sentence = sentence.dup
   end
  end
  word_count = longest_sentence.split.count
  puts longest_sentence.strip
  puts word_count
end

def clean_sentences(sentence_list)
  sentences = sentence_list.map do |sentence|
    sentence.gsub("\n", ' ')
  end
  p sentences
end

longest_sentence(text_file)


