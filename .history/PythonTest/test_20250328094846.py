


import time
def showtime(func):
    def wrapper():
        start_time = time.time()
        func()
        end_time = time.time()
        print('spend is {}'.format(end_time - start_time))
 
    return wrapper
 
@showtime  #foo = showtime(foo)
def foo():
    print('foo..')
    time.sleep(3)
 
@showtime #doo = showtime(doo)
def doo():
    print('doo..')
    time.sleep(2)
 
foo()
doo()




