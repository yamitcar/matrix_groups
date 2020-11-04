# Given a n*n matrix of zeros and ones, return an array [a,b] where "a" is the number of 1 groups and "b" is the number of 0 groups.
# A group is defined by adjacent(horizontally and/or vertically, but not diagonally) numbers of the same value.
# Some examples are given below:

input = [
[1, 0, 1, 1],
[0, 1, 0, 0],
[1, 0, 1, 1],
[1, 0, 0, 0]
]

# output = [5, 4]

input = [
[0, 0, 1, 1],
[0, 0, 1, 0],
[1, 0, 0, 1],
[1, 1, 1, 0]
]
# output = [3, 3]

input = [
[1, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 0],
[1, 1, 1, 1]
]

#output = [3, 1]