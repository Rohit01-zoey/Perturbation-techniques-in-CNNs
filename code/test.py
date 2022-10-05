import multiprocessing
import os
import numpy as np
import time  

mylist = np.random.rand(1000,1000)


def square(n):
    print("Worker process id for {0}: {1}".format(n, os.getpid()))
    return (n*n)
def pertme(k, pert = 1):
    #print("Worker process id for {0}-{1} : {2}".format(i, j, os.getpid()))
    mylist2 = mylist.copy()
    i, j = k
    mylist2[i, j] += pert
    return 1
  
if __name__ == "__main__":
    # input list
    
    print(multiprocessing.cpu_count())
    # creating a pool object
    p = multiprocessing.Pool()
  
    # map list to target function
    
    K = [i for i in range(0, 1000)]
    iter = [(i,j) for i in K for j in K ]
    start = time.time()
    result = p.map(pertme, [i for i in iter])
    end = time.time()
    print(f"Time required is {end-start}")
  
    #print(result, mylist)