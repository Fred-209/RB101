#   # Welcome Stranger
#   Create a method that takes 2 arguments, an array and a hash. The array will 
#   contain 2 or more elements that, when combined with adjoining spaces, will
#    produce a person's name. The hash will contain two keys, :title and 
#    :occupation, and the appropriate values. Your method should return a greeting 
#    that uses the person's full name, and mentions the person's title and occupation.
  
  
#   **Rules/Requirements**
  
#   *Input*: an array and a hash
#   *Output*: a string
  
#   *Explicit*: 
#   - The array will contain string elements
#   - The array will contain at least 2 elements
#   - The hash will contain two keys, :title and :occupation with the appropriate 
#   values
#   - return a string greeting that uses the person's full name and mentions 
#   their title and occupation

  
#   *Implicit*: 
#   - The returned string will need to have spaces around the name put together
#   from the elements in the given array

#   *Questions:*
  
#   **Examples/Test Cases**
  
#   ```ruby
#   greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
#   ```
  
#   **Data Structure**
  
#   Initial: array, hash
#   Intermediate: 
#   Return: string
  
#   **Algorithm**
  
#   *Return a string that says "Hello, name_goes_here! Nice to have a _title_
#   _occupation around here." where you are filling in these values from the given
#   array and string.*

#   - Join together the elements from the given array of strings, separated by spaces,
#   and save as `name`
#   - Return a string using, with string variables interpolated from the given array
#   and hash
#   - the data to interpolate will be `name`, hash[:title] and hash[:occupation]

#   **Code Implementation**

  def greetings(name_array, greeting_hash)
    name = name_array.join(' ')
    title = greeting_hash[:title]
    job = greeting_hash[:occupation]
    "Hello, #{name}! Nice to have a #{title} #{job} around."
  end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
