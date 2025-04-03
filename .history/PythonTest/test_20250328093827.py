


#修改闭包变量的实例
# outer是外部函数 a和b都是外函数的临时变量
def outer( a ):
    b = 10  # a和b都是闭包变量
    c = [a] #这里对应修改闭包变量的方法2
    # inner是内函数
    def inner():
        #内函数中想修改闭包变量
        # 方法1 nonlocal关键字声明
        nonlocal  b
        b+=1
        # 方法二，把闭包变量修改成可变数据类型 比如列表
        c[0] += 1
        print(c[0])
        print(b)
    # 外函数的返回值是内函数的引用
    return inner
 
 print(__name__)
if __name__ == '__main__':
 
    demo = outer(5)
    demo() # 6  11




