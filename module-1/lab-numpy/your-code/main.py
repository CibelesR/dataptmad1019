#1. Import the NUMPY package under the name np.
import numpy as np
import random


#2. Print the NUMPY version and the configuration.
print(np.__version__)
print(np.show_config())


#3. Generate a 2x3x5 3-dimensional array with random values. Assign the array to variable "a"
# Challenge: there are at least three easy ways that use numpy to generate random arrays. How many ways can you find?
a = np.random.random((2,3,5))
# a2 = np.empty((2,3,5))


#4. Print a.
print(a)


#5. Create a 5x2x3 3-dimensional array with all values equaling 1.
#Assign the array to variable "b"
b = np.ones((5,2,3))


#6. Print b.
print (b)


#7. Do a and b have the same size? How do you prove that in Python code?
def check_size (x,y):
    if x.size == y.shape:
        return f' the first list has the same size as the second one'
    else:
        return f' firts and second lists have not the same size'


print(check_size(a,b))


#8. Are you able to add a and b? Why or why not?
# I comment the point 8 in fact to avoid the Error. I am going to have an error because the size of both arrays are not the same

#c = a + b

#print(c)
#ValueError: operands could not be broadcast together with shapes (2,3,5) (5,2,3)

#9. Transpose b so that it has the same structure of a (i.e. become a 2x3x5 array). Assign the transposed array to varialbe "c".
c = b.transpose(1,2,0)
print(c.shape)
print(c)


#10. Try to add a and c. Now it should work. Assign the sum to varialbe "d". But why does it work now?
d = a + c


#11. Print a and d. Notice the difference and relation of the two array in terms of the values? Explain.
print(a)
print(d)
# d -which previously was b is an array of ones- represent the sum of the values of a and this ones. The result is correct


#12. Multiply a and c. Assign the result to e.
e = a * c
print(e)


#13. Does e equal to a? Why or why not?
def equal_arrays(x,y):
    if x.all() == y.all():
        return f'Both arrays are equal'
    else:
        return f'Not equal'

print(equal_arrays(e,a))
# I understand that anything multiply by one is the same.


#14. Identify the max, min, and mean values in d. Assign those values to variables "d_max", "d_min", and "d_mean"
d_max = np.max(d)
d_min = np.min(d)
d_mean = np.mean(d)

# Check
# print(d_max)
# print(d_min)
# print(d_mean)


#15. Now we want to label the values in d. First create an empty array "f" with the same shape (i.e. 2x3x5) as d using `np.empty`.
f = np.empty((2,3,5))

# Check
print('Time for f array:')
print (f)



"""
#16. Populate the values in f. For each value in d, if it's larger than d_min but smaller than d_mean, assign 25 to the corresponding
value in f.
If a value in d is larger than d_mean but smaller than d_max, assign 75 to the corresponding value in f.
If a value equals to d_mean, assign 50 to the corresponding value in f.
Assign 0 to the corresponding value(s) in f for d_min in d.
Assign 100 to the corresponding value(s) in f for d_max in d.
In the end, f should have only the following values: 0, 25, 50, 75, and 100.
Note: you don't have to use Numpy in this question.
"""
#print(f[0,0,0])
# Not working
'''def prueba(x):
    for i in x[i,i,i]:
        return i

print(prueba(f))'''
f = []



for i in d:
    for j in i:
        for n in j:
            #print (n)
            if n == d_mean:
                f.append(50)
            elif n == d_min:
                f.append(0)
            elif n == d_max:
                f.append(100)
            elif d_min < n < d_mean:
                f.append(25)
            elif d_mean < n > d_max:
                f.append(75)







#condition_1 = 25
#condition_2 = 75
#condition_3 = 0
#condition_4 = 100


#for i in f:
#    for j in i:
 #       for n in j:
#            #print (n)
 #           if d_mean < n > d_min:
 #               d.append(condition_1)
  #          elif d_max < n > d_mean:
   #             d.append(condition_2)
   #         elif n == d_min:
    #            d.append(condition_3)
     #       elif n == d_max:
         #       d.append(condition_4)




print('Prueba')
print(f)





"""
#17. Print d and f. Do you have your expected f?
For instance, if your d is:
array([[[1.85836099, 1.67064465, 1.62576044, 1.40243961, 1.88454931],
        [1.75354326, 1.69403643, 1.36729252, 1.61415071, 1.12104981],
        [1.72201435, 1.1862918 , 1.87078449, 1.7726778 , 1.88180042]],

       [[1.44747908, 1.31673383, 1.02000951, 1.52218947, 1.97066381],
        [1.79129243, 1.74983003, 1.96028037, 1.85166831, 1.65450881],
        [1.18068344, 1.9587381 , 1.00656599, 1.93402165, 1.73514584]]])

Your f should be:
array([[[ 75.,  75.,  75.,  25.,  75.],
        [ 75.,  75.,  25.,  25.,  25.],
        [ 75.,  25.,  75.,  75.,  75.]],

       [[ 25.,  25.,  25.,  25., 100.],
        [ 75.,  75.,  75.,  75.,  75.],
        [ 25.,  75.,   0.,  75.,  75.]]])
"""


"""
#18. Bonus question: instead of using numbers (i.e. 0, 25, 50, 75, and 100), how to use string values 
("A", "B", "C", "D", and "E") to label the array elements? You are expecting the result to be:
array([[[ 'D',  'D',  'D',  'B',  'D'],
        [ 'D',  'D',  'B',  'B',  'B'],
        [ 'D',  'B',  'D',  'D',  'D']],

       [[ 'B',  'B',  'B',  'B',  'E'],
        [ 'D',  'D',  'D',  'D',  'D'],
        [ 'B',  'D',   'A',  'D', 'D']]])
Again, you don't need Numpy in this question.
"""