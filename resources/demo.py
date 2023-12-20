from threading import Thread
import time

time.sleep(10)

print("starting")

count = 5_00_00_000


def countdown(n):
    while n > 0:
        n -= 1


start = time.time()
print(start)
countdown(count)
end = time.time()
print(end)
print("Time taken:", end - start)

t1 = Thread(target=countdown, args=(count // 2,))
# t2 = Thread(target=countdown, args=(count//2,))
# t3 = Thread(target=countdown, args=(count//2,))

start = time.time()
t1.start()
# t2.start()
# t3.start()
t1.join()
# t2.join()
# t3.join()
end = time.time()
print("Time taken:", end - start)


from multiprocessing import Pool, cpu_count

print(cpu_count())
