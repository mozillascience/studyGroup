# Comments are denoted by "#"

from __future__ import print_function   #Python 2.x compatibility for print function


########## HELLO WORLD ##########

# We're working within an interpreter (similar to Matlab),
# so we type code directly into the interpreter

print("Hello World")

# In Python 2.x, "print" is a statement and the parentheses
# should be removed.  Alternatively, you can use Python 3.x
# syntax after importing the __future__ module, as above.


########## DATA TYPES: NUMBERS & STRINGS ##########

# Python has five standard data types: numbers, string, lists,
# tuples, and dictionaries.  Let's deal with numbers and
# strings first.  Numbers can be ints (and longs in older
# versions), floats or complex.

# One advantage of the interpreter is we can solve math
# problems directly in it

2 + 2
12.*3				# The int gets typecast to float automatically
(1.+1j)/2.**0.5
1/2					# Be warned - this returns zero in Python 2.x!

# Note that running this .py as a script will not print those
# numbers to screen, but running the commands directly on the
# command line will.

# To figure out the data type of a variable, we can use:

x = 47
print(type(x))
x = "spam"
print(type(x))

# Variables don't have pre-declared types in Python, so you can
# assign any data type to any variable.

# As an aside, to get documentation on most things within Python:

help(type)

# We can also use the magic function "type?" in IPython.

# Print is intelligent, and we can pass it all sorts of weird
# things.

x = 42
print("This is a string, and these are numbers: ", x, 324.13, ", and another string.")

# String are character arrays, and their operations are an art form.
# Here is a smattering of commands.

s = "This is a test string"
print(s)
print(s[0])			# Array syntax in python - to access element i of an array, we do array[i]

# Python is 0-based - the first element of an array is index 0.

print(s[-3])		# Negative indicies access elements backwards from the end of the list
print(s[2:4])		# Accesses elements 2 - 3
print(s[6:])		# Accesses elements 6 and above
print(s + ' ' + s)	# Strings can be concatenated
print(s*10)			# Or multiplied...

print(s.replace('a test','the bestest')) # print a string with a replaced word

# Above, replace is a method, a function that is a part of an
# object (in this case, s).  Tab-completion can be used to determine
# what methods exist for a given object.

# Perform equality tests on strings; the output is a boolean.
# (Python doesn't care about using ' or " for strings.)

print(s == 'This is a test string')



########## DATA TYPES: LISTS, TUPLES & DICTS ##########

# Python has two array-like things.  The first is called a "list",
# which can hold any data types:

mylist = [1, "2", 3, 4.000, "five"]
print(len(mylist))						# Prints number of elements in list
print(mylist[2:])						# Indexing is the same as for strings
print(mylist + mylist)					# Adding lists combines them
print(mylist.index(4.))					# Return the index of a list element

# The second is called a "tuple", which is an immutable list (nothing
# can be added or subtracted) whose elements also can't be reassigned.
# They're easier on memory and processor than lists.

mytuple = (1, "2", 3j, 4.000, "five")

# Python also has dictionaries, which are unordered sets of values accessible
# by hashable keys (generally strings and numbers, but more exotic things
# are also possible).

mydict = {"dogs": "DOGS!", "dognumber": 47}			# Can also just write {} for a blank dictionary
mydict["dognames"] = ["spot", "rover", "agamemnon"]	# Can add dictionary entries after initialization
print(mydict)										# Print is versatile, and will give you a summary of your dict
del mydict["dogs"]									# Delete a key and its associated value

# Note that passing an "immutable type" of object, like a float, tuple
# or int, using "=" will make a copy of the value.

x = 4
y = x
print(x, y)
y = 7
print(x, y)

# Lists and dicts, however, are "mutable", and

x = ["alpha", "beta"]
y = x
print(x, y)
y[1] = "gamma"
print(x, y)

# To make a copy of a list, do:

y = list(x)		# x[:] also works
y[1] = "delta"
print(x, y)

# See https://en.wikibooks.org/wiki/Python_Programming/Data_Types#Mutable_vs_Immutable_Objects


########## IMPORTING LIBRARIES ##########

# If you want Matlab-style arrays, you'll need to install the
# numpy library.  Here, "try/except/else" means try <try code>, and
# if Python throws up an exception, do <except code>. If not, do
# <else code>.

try:
    import numpy as np						# Imports numpy library
except:
    print("You don't have numpy installed!  This section of code won't run.")
else:
    myarray = np.array([1,43,32.1,17,216])	# Create numpy array
    print(myarray)
    print(myarray*myarray/3.)				# Multiplication is element by element; "3." is typecast to an array of length myarray


########## LOOPS & CONDITIONALS ##########

# Like the try/except above, conditional statements and loops in
# Python are demarcated using indents.

# For loop that cycles over range(starting number, end number,
# stepsize).

for i in range(3,10,2):
    print(i)

# For loop; cycles over all elements in mylist from previous section.

for item in mylist:
    print(item)

# For loop that searches mylist for "five".

for item in mylist:
    if item == "five":
        print("'five' found!")
        break					# Exits loop
    else:
        print("Not yet...")

# The standard way of indenting in Python is four spaces.

i = 0
while i < 10:					# While loop
    if i > 5 and not i > 8:
        print(i*i)
    i += 1


########## FUNCTION DECLARATION ##########

# Here's a simple function.  (str() typecasts to string.)

def myf(x,y):
    print('You called myf(x,y) with the value x = ' + str(x) + ' and y = ' + str(y))
    print('x * y = ' + str(x*y))

myf(13,17)

# Functions don't have to be declared in a header, and arguments
# don't need to have a pre-declared data type.

def printtype(x="dummy"):
    """Functions don't have to be declared in a header, and arguments
    don't need to have a pre-declared data type.

    Here I've also given argument "x" a default value; if x is not
    user-defined, its value is set to "dummy".  This function also returns
    a value (to return multiple values, you can use lists).
    """
    print("You've entered a ", type(x), "whose value is", x)
    return type(x)

rt = printtype(4)
rt = printtype("eight")
rt = printtype()
print(rt)

# The block denoted by """ is called a "docstring", used to document the
# usage of a function.  It can be accessed by

help(printtype)

# Immutable types passed as an argument into a function can't be changed
# by the function:

def trytochange(x):
    x = 10

x = 2
print(x)
trytochange(x)
print(x)

# Mutable types can.

def trytochangelist(x):
    x[1] = "CHANGED!"

changethis = ["first", "second", "third"]
print(changethis)
trytochangelist(changethis)
print(changethis)


########## IPYTHON MAGIC FUNCTIONS ##########

# IPython has a set of "magic functions", including ? above.
# Another is %paste, which pastes commands onto the command
# line, properly interpreting indentations (just pasting
# often doesn't).

# Try to %paste this block of code into IPython.

def badfunction(x):
    y = x**2
    z = thisdoesntexist
    return y*z

badfunction(10)

# It should throw up an error message.  Now type in %debug,
# which takes you into the interactive debugger.


########## IF WE HAVE TIME, WE'LL COVER THESE ##########

########## FUNCTIONS IN FUNCTIONS ##########

## We can also declare functions WITHIN other functions.  This is useful for generating functions with custom values:

#def makepwrlaw(alpha, beta):
#   def pwrlaw(x):
#       return alpha*x**beta
#   return pwrlaw

#mypowerlaw = makepwrlaw(0.5,2)
#print(mypowerlaw(2))


########## CLASS DECLARATIONS ##########

## Lastly, we can define classes, which allow us to create objects that carry both values and associated functions.

#class User:

#   def __init__(self, name, dept):			# class constructor
#       self.name = name						# store values
#       self.dept = dept
#
#    def sayHello(self):						# class method
#        print("Hello, my name is " + self.name + " from the " + self.dept)

#jane = User("Jane Doe", "CompSci")
#jane.sayHello()
