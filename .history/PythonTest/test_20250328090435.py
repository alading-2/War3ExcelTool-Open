

# 装饰函数
def funA(fun):
    def funB(*args, **kw):
        print('函数 ' + fun.__name__ + ' 开始执行')
        fun(*args, **kw)
        print('函数 ' + fun.__name__ + ' 执行完成')
    return funB

@funA
# 业务函数
def funC(name):
  print('Hello', name)

funC('Jhon')




