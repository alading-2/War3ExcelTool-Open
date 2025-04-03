from pygments import highlight
from pygments.lexers import PythonLexer
from pygments.formatters import HtmlFormatter
 
code = '''
def hello_world():
    print("Hello, World!")
'''
 
# 使用PythonLexer进行语法分析，HtmlFormatter进行HTML格式化
html_code = highlight(code, PythonLexer(), HtmlFormatter())
 
# 输出HTML
print(html_code)













