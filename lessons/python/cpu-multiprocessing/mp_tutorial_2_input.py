import multiprocessing

def worker(num):
    """
    Worker function
    """
    print("worker:", num)
    return

if __name__ == '__main__':
    jobs = []
    for i in range(5):
        #target is the function we are sending to Process
        #args must be a tuple otherwise it will evaluate the item itself
        p = multiprocessing.Process(target=worker, args=(i,))
        jobs.append(p)
        p.start()
        #output won't necessarily be in order depending on how they were executed
