# The PEDAC Process

## P: Understanding the Problem

- Establish the rules / define boundaries of the problem
  - Assess available information
  - Restate Explicit requirements 
  - Indentify Implicit requirements
- Spend enough time here, don't rush this step.

**General Example**

Given a string, produce a new string with every other word removed.

- Explicit requirements: 
  - Input: string
  - Output: new string
  - Remove every other word from the input string

- Questions: 
  - What do we mean by every other word?
  - How do we define what a word is in this context?
    - Words are delimited by spaces



## E: Examples and Test Cases

- Can confirm or refute assumptions
- Help to answer questions about implicit requirements
- Act as assertions which help to codify the rules and boundaries


## D: Data Structures

- Help reason with data logically
- Help interact with data at the implementation level
- Thinking in terms of data structures is part of the problem solving process
- Data structures closely linked to algorithms
   - Set of steps from input to output
    - Involves structuring data in a certain way


## A: Algorithms

- A logical sequence of steps for accomplishing a task or objective
  - Closely linked to data structures
  - Series of steps to structure data to produce the required output
- Stay abstract and high level 
  - Avoiding implementation detail
  - Don't worry about efficiency for now



## C: Implementing a solution in code

- Translating solution algorithm to code
- Think about the algorithm in the context of the programming language
  - Language features and constraints
  - Characteristics of data structures
  - Built in functions/ methods
  - Syntax and coding patterns
- Create test cases
- Code with intent



## Sum Even Number Rows

Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on. Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row.

**Rules/Requirements**

- Sequence of integers
- Integers are even
- Sequence begins with two
- Integers are consecutive
- Sequence is grouped in to rows
- Each row is incrementally larger 1, 2, 3, ...
- Row 'number' equals the number of elements in the row
  - Row 1 has 1 element, row 2 has 2 elements, and so on
- Input: a single integer
  - Identifies a 'row', which is a subset of a sequence of integers
- Output: a single integer
  - The sum of the integers in the row indentified by the input integer

- Sequence: 
2, 4, 6, 8, 10, 12, 14, 16, 18...

2
4, 6
8, 10, 12
14, 16, 18, 20
...

- How do we create the structure?

**Examples**

row number: 1 --> sum of integers in row: 2
row number: 2 --> sum of integers in row: 10
row number: 3 --> sum of integers in row: 68

2 --> 2
4, 6 --> 10
14, 16, 18, 20 --> 68


**Data Structure**

2
4, 6
8, 10, 12
14, 16, 18, 20
...

- Overall structure representing sequence as a whole
- Individual rows within overall structure
- Individual rows in a set order in context of sequence
- Individual rows contain integers
- Can assume that integers are in a set order in the context of the sequence

[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20],
  ....
]

**Algorithm**

1. Create an empty 'rows' array to contain all of the rows
2. Create a 'row' and add it to the overall 'rows' array
3. Repeat step 2 until all the necessary rows have been created.
  - All the rows have been created when the length of the 'rows' array is equal
    to the input integer
4. Sum the final row
5. Return the sum

*Problem: Create a row*

Rules: 
- Row is an array
- the array contains integers
- the integers are consecutive even numbers
- integers in each row form parts of a larger overall sequence
- the rows are different lengths
- Input: the information needed to create the output
  - The start integer
  - Length of the row
- Output: the row itself '[8, 10, 12]'

Examples: 
start: 2, length: 2--> [2]
start: 4, length: 2 --> [4, 6]
start: 8, length: 3 --> [8, 10, 12]

Data structures: 
- An array of integers

Algorithm:
1. Create an empty 'row' array to contain the integers
2. Add the starting integer
3. Increment the starting integer by 2 to get the next integer
4. Repeat steps 2 and 3 until the has reached the correct length
5. Return the 'row' array

##Final Thoughts

- Not a completely linear process
- Move back and forwards between the steps
- Switch from implementation mode to abstract problem solving mode when necessary
- Don't try to problem solve at the code level