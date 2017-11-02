from joblib import Parallel, delayed, cpu_count

def f(x, y):
    return x * y

if __name__ == '__main__':
    y = 2
    inputs = list(range(10))
    print('Input   :', inputs)

    builtin_outputs = [f(x,y) for x in inputs]
    print('Built-in:', builtin_outputs)

    #number of threads to use
    pool_size = cpu_count()
    print("Number of processes:", pool_size)
    outputs = Parallel(n_jobs=pool_size)(delayed(f)(x,y) for x in inputs)

    print('Pool:', outputs)
