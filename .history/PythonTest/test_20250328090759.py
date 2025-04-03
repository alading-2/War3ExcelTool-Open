


# 装饰函数
def funA(flag):
    def funB(fun):
        def funC(*args, **kw):
            if flag == True:
                print('==========')
            elif flag == False:
                print('----------')
            fun(*args, **kw)
        return funC
    return funB

@funA(False)
# 业务函数
def funD(name):
  print('Hello', name)

funD('Jhon')




