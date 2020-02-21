# R tips and little tidbits
# I don't know how I should structure all of this but it is swirl notes

#### Tips

# you can get random data sets with data()

# save entire workspace with save.image()

# You can edit data with a gui by using the edit command
# edit(mtcars) as an example. Remember you have to set the 
# dataset to the one manually edited. mtcars <- edit(mtcars)
# also don't do this. It is not reproducible. It is bad.

# save data to a text file with comma separated values.

#### Working with files and directories

# you can find the arguments of any function with the args function
args(list.files)

# getwd() is to get the current directory

# dir.create("testdir") is to create a new directory

# create a file with file.create("testFile.R")

# to list all files in directory type list.files()

# to see if a file exists run file.exists("testFile.R")

# To change a filename use file.rename(file1, file2)

# It seems like R is object oriented all functions go object.function()

# Determine file path by doing file.path(filneame). I don't get the point of this

# dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE) this is creating multiple

############################################################################################

# This is number related functions. Creating sequences

# Use the ':' function to create a list of numbers incremented by 1. It does forward and backward

# an alternative way to do it is to use the seq(start, end) function

# seq also works like seq(5, 10, 0.5), or seq(5, 10, length = 30)

# You can check length of objects with length() function

# there are also additional functions for making an additional list that is the length of objects
# One is seq_along(my_seq) which makes a sequence the length of my_seq

# you can build lists of numbers with rep function rep(n, times = m) it does the object m times

# There is also additional ways to replicate using each rep(n, each = m) where n = c(0, 1, 2) will replicate each number m times

##### Vectors

# simplest and most common data structure in R is the vector

# create vectors with c function. You can operate on the vectors with various functions and create new ones from that. Like true/false vectors

# There are logical operators < > <= >= | & and !. They operate in regular notation like python.

# You can make a vector of strings and then combine them with paste(stringVector, collapse = " ")

# To concatenate, just use the c function. It adds on in place. It is not creating a new function. This is stateful
# and bad from a functional perspective. c(oldVector, "newstring"). Nevermind they set into a new vector. It is not stateful.

# paste can also just be used with strings. paste(string1, string2, sep = " ")

# You can also paste with different object types and combine to new string > paste(1:3, c("X", "Y", "Z"), sep = "")

###### Missing Values

# NA is missing values. Nothing gets operated on them.

# You can create a normal distribution with rnorm(n)

# You can sample data from two vectors with sample function sample(c(x, y), 100) will take 100 elements from x and y

# you can use is.na(data) on different data to see if values are missing. So I guess to clean missing data or do something with them you
# would convert to something else.

# using my_data == NA is not equivalent to is.na(my_data)

# True is equivalent to 1 and false to 0. I think they get coerced.

#### Subsetting Vectors

# To get a subset of a vector you use brackets vector[1:10] is the first 10 elements.

# y <- x[!is.na(x)] to get all values of vector that are not NA

# If you don't filter out all of the NA's from the dataset, operations will keep them in. So if trying to select all
# numbers greater than 10. All the NA's will still be kept when printing.

# it is one-based indexed. I can look for values outside of the vector in terms of index and no errors will be thrown.
# You can also select specific parts with a single digit, or multiples with a vector c(x, y, z)

# To select all numbers but a subset you turn them into negative numbers. This is really weird. I don't like it at all.
# bad code design I think. I could see it working out though. WIll have to experiment more. c( -2, -10) as an example.

# There is some stuff on attaching names to vectors with foo = n or just going names(vect) <= c("foo", "bar").
# There is also use of the identical() function to determine if two vectors are the same.

#### Matrices and Data Frames

# dim() gives dimension of objects

# by using dim() on a vector you can convert a vector to a matrix

# So data frame is the big data object. That allows strings and numbers. Matrix is only one data type.
# With that in mind, We added patient names to the data by just doing a new data.frame of vectors and a matrix
# my_data <- data.frame(patients(vector), my_matrix(matrix)) I don't know if this is the best way.

# Then from their the dataset doesn't have variable names, so I created a new vector of all of the variable names
# and added it to the dataframe with colnames. That is like an attribute of a dataframe

## Logic

# To check equality of values use ==

# This covers a lot of the logical operators I already know from other languages.

# & is different from &&. With vectors & evaluates all. && only evaluates first element.

# and operators always evaluated before the or operators

# which is an interesting function. Takes a data and logical operations and
# you can ask questions basically, which values are greater than 5

# any() is another interesting function. Give it a logical statement and it will
# see if any of those apply to the vector

#### Functions

# function_name <- function(arg1, arg2){
#	# Manipulate arguments in some way
#	# Return a value
# }

# you can set default values for args with = ex. denominator = 2

# Order of arguments doesn't matter if I am explicit and use = sign
# That's why it works that way with different function calls I've
# been doing.

# I can do functional programming things with R. Remember that.
# Run things functionally as much as possible.