'''
 Due to the way the new processes are started, the child process needs to be able to import the script containing the target function. Wrapping the main part of the application in a check for __main__ ensures that it is not run recursively in each child as the module is imported. Another approach is to import the target function from a separate script.
'''
import multiprocessing
from mp_tutorial_2_input import worker

if __name__ == '__main__':
    jobs = []
    for i in range(5):
        #target is the function we are sending to Process
        #args must be a tuple otherwise it will evaluate the item itself
        p = multiprocessing.Process(target=worker, args=(i,))
        jobs.append(p)
        p.start()
        #output won't necessarily be in order depending on how they were executed
