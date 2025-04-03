


with open('test.txt', 'w', encoding='utf-8') as wf:
    wf.write('Tom\n')
    wf.writelines(['Hello\n', 'Python'])


with open('test.txt', 'r', encoding='utf-8') as rf:
    print('readline-->', rf.readline())
    print('read-->', rf.read(6))
    print('readlines-->', rf.readlines())








