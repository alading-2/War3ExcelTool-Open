import pandas as pd

data = {'c1': [1, 2, 3], 'c2': [4, 5, 6], 'c3': [7, 8, 9]}
pdata = pd.DataFrame(data=data)
rowData = pdata.loc[0]
print(rowData)
print(rowData.tolist())
