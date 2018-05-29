#!/usr/bin/python

"""
I have the following data structure (a list of lists)

[
 ['4', '21', '1', '14', '2008-10-24 15:42:58'], 
 ['3', '22', '4', '2somename', '2008-10-24 15:22:03'], 
 ['5', '21', '3', '19', '2008-10-24 15:45:45'], 
 ['6', '21', '1', '1somename', '2008-10-24 15:45:49'], 
 ['7', '22', '3', '2somename', '2008-10-24 15:45:51']
]

I would like to be able to

    Use a function to reorder the list so that I can group by each item in the list. For example I'd like to be able to group by the second column (so that all the 21's are together)

    Use a function to only display certain values from each inner list. For example i'd like to reduce this list to only contain the 4th field value of '2somename'

so the list would look like this

[
     ['3', '22', '4', '2somename', '2008-10-24 15:22:03'], 
     ['7', '22', '3', '2somename', '2008-10-24 15:45:51']
]
"""

a = [
 ['4', '21', '1', '14', '2008-10-24 15:42:58'], 
 ['3', '22', '4', '2somename', '2008-10-24 15:22:03'], 
 ['5', '21', '3', '19', '2008-10-24 15:45:45'], 
 ['6', '21', '1', '1somename', '2008-10-24 15:45:49'], 
 ['7', '22', '3', '2somename', '2008-10-24 15:45:51']
]

print
print "Ours list before sorting:"
print '\n'.join(str(x) for x in a)

#1:
a.sort(lambda x,y: cmp(x[1], y[1]))

print
print "Ours list after sorting by the second column"
print '\n'.join(str(x) for x in a)

#2:
b = filter(lambda x: x[3]=="2somename", a)
# or [y for y in a if y[3]=="2somename"]

print
print "Reduced list to only containin the 4th field value of '2somename'"
print '\n'.join(str(x) for x in b)

