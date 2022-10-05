import threading
import numpy as np
import time  

mylist = np.random.rand(1000,1000)


def square(n):
    print("Worker process id for {0}: {1}".format(n, os.getpid()))
    return (n*n)
def pertme(i, j):
    pert = 1
    #print("Worker process id for {0}-{1} : {2}".format(i, j, os.getpid()))
    mylist2 = mylist.copy()
    mylist2[i, j] += pert
    return 1
  
if __name__ == "__main__":
    # input list

  
    # map list to target function
    
    
    start = time.time()
    threads = [] 
    for m in range(1000000): 
        K = [i for i in range(0, 1000)]
        iter = [(i,j) for i in K for j in K ]
        print('hfbesbf')
        for i in iter:                                                                                                            
            threads.append(threading.Thread(target=pertme, args=(iter)))         
            threads[-1].start()
            print('ccccknfwkjsnf')

    for t in threads:                                                           
        t.join() 
    print(f"Time required is {end-start}")
