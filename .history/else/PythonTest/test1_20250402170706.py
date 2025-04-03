import pandas as pd


def _parse_data_rows(self, df: pd.DataFrame, keys: List) -> List[Dict]:
    """
        解析数据行，将DataFrame中的数据转换为字典列表
        
        Args:
            df: DataFrame数据，pandas的数据表格对象
            keys: 键列表，表示每列的字段名
            
        Returns:
            数据行列表，每个元素是一个字典，表示一行数据
        """
    # 创建空列表，用于存储解析后的数据行
    data_rows = []

    # 遍历DataFrame中的行，从第三行开始（索引2）
    # idx是行索引，row是行数据
    for idx, row in df.iloc[2:].iterrows():
        # 检查是否为注释行（首列数据为空或者以"//"开头的行视为注释，将被跳过）
        # str(): 用于将对象转换为字符串。strip(): 去除字符串两端的空格
        # startswith(): 检查字符串是否以指定的前缀开头
        if row.iloc[0] == "" or str(row.iloc[0]).strip().startswith("//"):
            continue  # 跳过本次循环，处理下一行

        # 提取行ID（第一列的值）
        row_id = row.iloc[0]

        # 创建行数据字典，并设置ID字段
        row_data = {"id": row_id}

        # 遍历行中的每个单元格（从第二列开始）
        # i是列索引（从1开始），value是单元格的值
        for i, value in enumerate(row.iloc):
            # 跳过空数据单元格（NaN或空字符串）
            if pd.isna(value) or value == "":
                continue

            # 检查列索引是否在键列表范围内
            if i < len(keys):
                # 获取当前列的键名
                key_name = keys[i]
                # 将值添加到行数据字典中
                row_data[key_name] = value

        # 将处理好的行数据添加到结果列表中
        data_rows.append(row_data)

    # 返回所有数据行的列表
    return data_rows


file_path = "else\Test\excel\演员单位.xlsx"
xl = pd.ExcelFile(file_path)
sheet_names = xl.sheet_names
for sheet_name in sheet_names:
    # 使用pandas读取指定sheet的内容
    df = pd.read_excel(file_path, sheet_name=sheet_name, header=None)
    # 提取第一行作为注释信息（列说明）
    comments = df.iloc[0].tolist()
    print("comments:", comments)
    # 提取第二行作为数据的键名
    keys = df.iloc[1].tolist()
    print("keys:", keys)
    # 从第三行开始解析数据行
    data_rows = _parse_data_rows(df, keys)
    for row_idx, row in enumerate(data_rows):
        print(f"Row {row_idx}: {row}")
