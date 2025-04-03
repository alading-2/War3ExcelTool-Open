


with open('test.txt', 'w', encoding='utf-8') as wf:
    wf.write('Tom\n')
    wf.writelines(['Hello\n', 'Python\n','aaa\naaa'])


with open('test.txt', 'r', encoding='utf-8') as rf:
    print('readline-->', rf.readline())
    print('read-->', rf.read(6))
    print('readlines-->', rf.readlines())
    
    
with open('test.txt', 'rb+') as f:
    f.write(b'123456789')
    # 文件对象位置
    print(f.tell())
    # 移动到文件的第四个字节
    f.seek(3)
    # 读取一个字节，文件对象向后移动一位
    print(f.read(1))
    print(f.tell())
    # 移动到倒数第二个字节
    f.seek(-2, 2)
    print(f.tell())
    print(f.read(1))








