
import re
import re
a = """aaatestaa     
aaaa123"""
print(re.findall(r'test.*123',a))       
print(re.findall(r'test.*123',a,re.S))

key = "威胁"
a = """
<body data-spm="7663354">
  <div data-spm="1998410538">
    <div class="header">
      <div class="container">
        <div class="message">
          很抱歉，由于您访问的URL有可能对网站造成安全威胁，您的访问被阻断。
          <div>您的请求ID是: <strong>
781bad0a16702307419116917e43b3</strong></div>
        </div>
      </div>
    </div>
"""
res = re.search(r'<.*>(.*?%s.*?)<.*?>'%(key),a,re.S)
print(res.group(1).replace("\n","").replace(" ",""))


