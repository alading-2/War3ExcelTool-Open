


import time
def showtime(func):
    def wrapper(a, b):
        start_time = time.time()
        func(a,b)
        end_time = time.time()
        print('spend is {}'.format(end_time - start_time))
    
    return wrapper
 
@showtime #add = showtime(add)
def add(a, b):
    print(a+b)
    time.sleep(1)
 
@showtime #sub = showtime(sub)
def sub(a,b):
    print(a-b)
    time.sleep(1)
 
add(5,4)
sub(3,2)
    




