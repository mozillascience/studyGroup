from joblib import Parallel, delayed, cpu_count


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
    outputs = Parallel(n_jobs=pool_size)(delayed(f)(x) for x in inputs)


    print('Result:', outputs)
