# This is trial stuff for learning R.
# These are how you do comments. # is the first thing.
# There are no multiline comments in R.
# All of this is from andy fields textbook. It's a good little first run through

# Andy Field recommends setting the working directory at the start of the file. I am doing
# that right now. You don't have to use the full pathway. You can just use from where you are at.
# That sets where I will be able to load any files or data.
setwd("/home/david/programming/r/Learning")

# To install packages you use the install.packages("package.name") command. Run this in the console.
# Then you use it by running the library(package.name) command. It is not in quotes.
# It is a collection of functions now.

# If two packages have the same function you use :: to show difference.

# You can select lines of code in the text editor and run it. It will run in the console.

# DATA
# Create variables with R to create data. There are string and number data types. Much more too.
# You use the arrow <- for variable assignment.
# c() is concatenate. For creating a list.
metallicaNames <- c("Lars", "James", "Kirk", "Rob")

metallicaAges <- c(47, 47, 48, 46)

# Dataframe
# To combine variables into one data object you use data.frame().
# The dataframe is like the spreadsheet in excel or spss.
# It's a big object with lots of variables connected to it. Where most of the analysis work will be done.
# This creates a dataframe metallica where we can observed the different parts of it instead of making seperate variables life before.
metallica <- data.frame(Name = metallicaNames, Age = metallicaAges)

# You can run the metallica variable below, right now. To run the code you can select all and click run above. Or you can click source and type
# metallica in the console.
metallica

# To get specific parts of a dataframe you use convention of dataframe$variableName
# age of metallica members metallica$Age name is metallica$Name

# Create a new variable for the dataframe by just adding it dataframe$newVariableName <- c(stuff)
metallica$childAge <- c(12, 12, 4, 6)

# To list all variable names in a dataframe do names(dataframe) no quotes
names(metallica)

# Ended at 3.5.3 in Field's R book. On creating new variables.
