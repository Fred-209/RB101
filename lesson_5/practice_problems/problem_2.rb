# Practice Problem 2

# How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]


# No need to convert :published to an integer because the string representations
# of integers as the values in the ':published' key are all the same length, therefore they will have the same sort return value as if they were integers

books.sort_by do|book|
  book[:published] 
end

