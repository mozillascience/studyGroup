from joblib import Parallel, delayed, cpu_count

def f(x, y):
    return x * y

if __name__ == '__main__':
    y_vals = list(range(10,20))
    x_vals = list(range(10))
    inputs = list(zip(x_vals,y_vals))
    print('Input   :', inputs)

    builtin_outputs = list(map(f, x_vals, y_vals))
    print('Built-in:', builtin_outputs)

    #number of threads to use
    pool_size = cpu_count()
    print("Number of processes:", pool_size)
    #can specify backend parameter to use threads
    outputs = Parallel(n_jobs=pool_size)(delayed(f)(x,y) for x,y in inputs)

    print('Pool:', outputs)
