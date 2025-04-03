import pandas as pd
import numpy as np
sdata = pd.Series(np.arange(1,4), index=list('abc'))

# 获取索引
print(sdata.index.values)














