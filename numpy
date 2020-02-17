import numpy as np
x = np.array([1, 2, 3, 4, 5])
#可以通过 .shape 属性获取 ndarray 的形状。shape 属性返回一个由 n 个正整数（用于指定每个维度的大小）组成的元组。
print('x has dimensions:', x.shape)
print('x is an object of type:', type(x))
print('The elements in x are of type:', x.dtype)
#x has dimensions: (5,)
#x is an object of type: class 'numpy.ndarray'
#The elements in x are of type: int64
___________________________________________________________________________________________________
布尔型索引
# We create a 5 x 5 ndarray that contains integers from 0 to 24
X = np.arange(25).reshape(5, 5)

# We print X
print()
print('Original X = \n', X)
print()

# We use Boolean indexing to select elements in X:
print('The elements in X that are greater than 10:', X[X > 10])
print('The elements in X that lees than or equal to 7:', X[X <= 7])
print('The elements in X that are between 10 and 17:', X[(X > 10) & (X < 17)])

# We use Boolean indexing to assign the elements that are between 10 and 17 the value of -1
X[(X > 10) & (X < 17)] = -1

# We print X
print()
print('X = \n', X)
print()


Original X =
[[ 0 1 2 3 4]
 [ 5 6 7 8 9]
 [10 11 12 13 14]
 [15 16 17 18 19]
 [20 21 22 23 24]]

The elements in X that are greater than 10: [11 12 13 14 15 16 17 18 19 20 21 22 23 24]
The elements in X that lees than or equal to 7: [0 1 2 3 4 5 6 7]
The elements in X that are between 10 and 17: [11 12 13 14 15 16]

X =
[[ 0 1 2 3 4]
 [ 5 6 7 8 9]
 [10 -1 -1 -1 -1]
 [-1 -1 17 18 19]
 [20 21 22 23 24]]
 
 _______________________________________________________________________________________________
NumPy 还允许进行集合运算。可以用来比较 ndarray，例如查找两个 ndarray 中的相同元素
# We create a rank 1 ndarray
x = np.array([1,2,3,4,5])

# We create a rank 1 ndarray
y = np.array([6,7,2,8,4])

# We print x
print()
print('x = ', x)

# We print y
print()
print('y = ', y)

# We use set operations to compare x and y:
print()
print('The elements that are both in x and y:', np.intersect1d(x,y))
print('The elements that are in x that are not in y:', np.setdiff1d(x,y))
print('All the elements of x and y:',np.union1d(x,y))

x = [1 2 3 4 5]

y = [6 7 2 8 4]

The elements that are both in x and y: [2 4]
The elements that are in x that are not in y: [1 3 5]
All the elements of x and y: [1 2 3 4 5 6 7 8]
__________________________________________________________________________
当 np.sort() 当做函数使用时，它不会对ndarray进行就地排序，即不更改被排序的原始 ndarray。
但是，如果将 sort 当做方法，ndarray.sort() 会就地排序 ndarray，即原始数组会变成排序后的数组。
# We create an unsorted rank 1 ndarray
x = np.random.randint(1,11,size=(10,))

# We print x
print()
print('Original x = ', x)

# We sort x and print the sorted array using sort as a function.
print()
print('Sorted x (out of place):', np.sort(x))

# When we sort out of place the original array remains intact. To see this we print x again
print()
print('x after sorting:', x)

Original x = [9 6 4 4 9 4 8 4 4 7]

Sorted x (out of place): [4 4 4 4 4 6 7 8 9 9]

x after sorting: [9 6 4 4 9 4 8 4 4 7]
__________________________________________________
我们可以根据需要，同时使用 sort 函数和 unique 函数仅对 x 中的唯一元素进行排序
print(np.sort(np.unique(x)))
___________________________________________________
 sort 当做方法，原地对 ndarray 进行排序
 # We create an unsorted rank 1 ndarray
x = np.random.randint(1,11,size=(10,))

# We print x
print()
print('Original x = ', x)

# We sort x and print the sorted array using sort as a method.
x.sort()

# When we sort in place the original array is changed to the sorted array. To see this we print x again
print()
print('x after sorting:', x)


Original x = [9 9 8 1 1 4 3 7 2 8]

x after sorting: [1 1 2 3 4 7 8 8 9 9]
_______________________________________________________
在对秩为 2 的 ndarray 进行排序时，我们需要在 np.sort() 函数中指定是按行排序，还是按列排序。
为此，我们可以使用关键字 axis。
# We create an unsorted rank 2 ndarray
X = np.random.randint(1,11,size=(5,5))

# We print X
print()
print('Original X = \n', X)
print()

# We sort the columns of X and print the sorted array
print()
print('X with sorted columns :\n', np.sort(X, axis = 0))

# We sort the rows of X and print the sorted array
print()
print('X with sorted rows :\n', np.sort(X, axis = 1))

Original X =
[[6 1 7 6 3]
  [3 9 8 3 5]
  [6 5 8 9 3]
  [2 1 5 7 7]
  [9 8 1 9 8]]

X with sorted columns :
[[2 1 1 3 3]
  [3 1 5 6 3]
  [6 5 7 7 5]
  [6 8 8 9 7]
  [9 9 8 9 8]]

X with sorted rows :
[[1 3 6 6 7]
  [3 3 5 8 9]
  [3 5 6 8 9]
  [1 2 5 7 7]
  [1 8 8 9 9]]


