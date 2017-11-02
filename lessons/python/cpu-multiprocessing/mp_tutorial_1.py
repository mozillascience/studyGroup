import multiprocessing

def worker():
    """
    Worker function
    """
    print("worker")
    return

if __name__ == '__main__':
    jobs = []
    for i in range(5):
        #target is the function we are sending to Process
        p = multiprocessing.Process(target=worker)
        jobs.append(p)
        p.start()
