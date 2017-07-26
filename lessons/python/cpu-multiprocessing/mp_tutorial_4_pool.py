'''
The Pool.map and Pool.apply will lock the main program until all a process is finished, which is quite useful if we want to obtain resuls in a particular order for certain applications.
In contrast, the async variants will submit all processes at once and retrieve the results as soon as they are finished. One more difference is that we need to use the get method after the apply_async() call in order to obtain the return values of the finished processes.
'''

from multiprocessing import Pool, current_process, cpu_count


def f(x):
    return x * 2

def start_process():
    print('Starting', current_process().name)

if __name__ == '__main__':
    inputs = list(range(10))
    print('Input   :', inputs)

    builtin_outputs = list(map(f, inputs))
    print('Built-in:', builtin_outputs)

    #number of threads to use
    pool_size = cpu_count()
    print("Number of processes:", pool_size)

    pool = Pool(processes=pool_size, initializer=start_process)
    #using pool.map()
    pool_outputs = pool.map(f, inputs)

    #using pool.apply()
    #pool_outputs = [pool.apply(f, args=(x,)) for x in inputs]

    #using pool.apply_async()
    #pool_outputs = [pool.apply_async(f, args=(x,)) for x in inputs]
    #need to use p.get()
    #pool_outputs = [p.get() for p in pool_outputs]

    pool.close() # no more tasks
    pool.join()  # wrap up current tasks

    print('Pool:', pool_outputs)
