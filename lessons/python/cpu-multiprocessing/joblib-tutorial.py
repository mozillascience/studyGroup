from joblib import Parallel, delayed

def f(x):
    return x * 2

if __name__ == '__main__':
    inputs = list(range(10))
    print('Input   :', inputs)

    builtin_outputs = list(map(f, inputs))
    print('Built-in:', builtin_outputs)

    #number of threads to use
    pool_size = cpu_count() * 2
    print("Number of processes:", pool_size)
    pool = Pool(processes=pool_size, initializer=start_process)
    pool_outputs = pool.map(f, inputs)
    pool.close() # no more tasks
    pool.join()  # wrap up current tasks

    print('Pool:', pool_outputs)
