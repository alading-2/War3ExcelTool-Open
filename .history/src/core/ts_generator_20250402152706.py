import os  # 导入操作系统模块，用于处理文件路径和创建目录
from typing import Dict, List, Any, Tuple, Optional  # 导入类型提示功能
import logging  # 导入日志模块
from ..utils.logger import get_logger  # 从项目的utils目录导入自定义日志获取函数

# 获取当前模块的日志记录器
logger = get_logger(__name__)  # __name__是Python的特殊变量，表示当前模块名称


class TSGenerator:
    """生成TypeScript代码的类
    
    这个类负责将从Excel提取的数据转换成TypeScript代码文件，
    包括生成接口定义、数据常量和类定义等。
    """

    def __init__(self, type_handler):
        """
        初始化TSGenerator类的新实例
        
        Args:
            type_handler: 类型处理器实例，用于处理数据类型转换和格式化
        """
        # 获取一个与当前类关联的日志记录器
        self.logger = logging.getLogger(__name__)
        # 保存类型处理器的引用，后面用于类型推断和值格式化
        self.type_handler = type_handler

    def generate_ts_file(self,
                         excel_name: str,
                         metadata: Dict[str, Any],
                         keys: List[str],
                         data_rows: List[Dict],
                         color_map: Dict[str, str],
                         output_dir: str,
                         sheet_name: Optional[str] = None):
        """
        生成TypeScript文件
        
        将Excel数据转换为TypeScript代码，并写入到文件中。
        生成的文件包括接口定义、常量和数据数组，以及一个封装类。
        
        Args:
            excel_name: Excel文件名（不含扩展名），用于生成TypeScript文件名和类名
            metadata: 元数据，包含注释和其他相关信息
            keys: 键名列表，表示数据字段的名称
            data_rows: 数据行列表，每个元素是包含数据的字典
            color_map: 颜色映射，包含单元格位置到颜色代码的映射
            output_dir: 输出目录，指定生成的TypeScript文件保存位置
            sheet_name: 可选的sheet名称，用于日志记录
            
        Returns:
            生成的文件路径，指向创建的TypeScript文件的完整路径
            
        Raises:
            Exception: 当生成TypeScript文件过程中出现错误时
        """
        try:
            # 分离文件名与扩展名，返回(f_name, f_extension)元组。
            excel_name = os.path.splitext(excel_name)[0]

            # 从数据中提取TypeScript代码片段（如import语句和其他代码）
            imports, other_code = self.type_handler.extract_ts_code(
                data_rows, keys)

            # 生成不同TypeScript元素的名称，基于Excel文件名
            # 接口键名常量
            interface_keys_name = f"xlsx_inte_keys_{excel_name}"
            # 接口名称
            interface_name = f"xlsx_inte_{excel_name}"
            # 数据数组名称
            data_name = f"xlsx_data_{excel_name}"
            # 类名
            class_name = f"xlsx_{excel_name}"

            # 用于收集生成的TypeScript代码片段
            # 接口键常量xlsx_inte_keys_name
            interface_keys = []
            # 接口属性定义（字段名和类型）xlsx_inte_name
            interface_props = []

            # 遍历所有列（不包括code列），推断每列的数据类型
            for i, key in enumerate(keys):
                # 跳过code列（它包含TypeScript代码片段，不是数据字段）
                if key == "code":
                    continue

                # 收集key对应的一列的所有值，用于推断类型
                values = [row.get(key) for row in data_rows if key in row]

                # 确定字段类型：遍历所有值，推断每个值的类型，并收集到集合中
                types = set()  # 使用集合自动去重
                for value in values:
                    if value is not None:  # 跳过None值
                        # 使用类型处理器推断值的TypeScript类型
                        types.add(self.type_handler.infer_type(value))

                # 根据收集到的类型确定最终字段类型
                if len(types) == 0:  # 如果没有收集到类型（可能全是None）
                    field_type = "any"  # 使用any类型
                elif len(types) == 1:  # 如果只有一种类型
                    # iter(types):集合转换迭代器，next() 函数从迭代器中提取第一个可用元素。由于此时len(types) == 1的判断已确保集合中只有唯一元素，因此无论集合实际存储顺序如何，总能正确获取到该唯一类型。
                    field_type = next(iter(types))
                    base_type = ["string", "number", "boolean", "any"]
                    if field_type not in base_type:
                        # 如果类型不是基本类型，使用any
                        field_type = "any"
                else:
                    # 多种类型情况，使用联合类型
                    if "any" in types:  # 如果包含any，则结果就是any
                        field_type = "any"
                    else:
                        # 使用TypeScript的联合类型语法：type1 | type2 | ...
                        field_type = " | ".join(types)

                # 添加到接口键定义列表（作为常量对象的属性）
                interface_keys.append(key)
                # 添加到接口属性定义列表（字段名和类型）
                interface_props.append(f'    {key}?: {field_type};')

            # 生成数据数组项
            data_entries = []

            # 遍历所有数据行，为每行生成对应的TypeScript对象字面量
            for row_idx, row in enumerate(data_rows):
                # 当前行的所有字段键值对
                row_entries = []

                # 遍历所有键，处理当前行中的每个字段
                for key in keys:
                    # 跳过不存在的键和code列
                    if key not in row or key == "code":
                        continue

                    # 获取字段值和推断的类型
                    value = row[key]
                    value_type = self.type_handler.infer_type(value)

                    # 检查单元格是否有颜色代码
                    color_code = None
                    # 构造单元格位置标识符（格式：行号_列号）
                    # row_idx+3是因为从第三行开始是数据，前两行是注释和键名
                    # keys.index(key)+1是因为列索引从1开始

                    #TODO 颜色部分暂时不做处理
                    # 如果单元格有颜色且值是字符串类型，则获取颜色代码
                    # cell_pos = f"{row_idx+3}_{keys.index(key)+1}"
                    # if cell_pos in color_map and value_type == "string":
                    #     color_code = color_map[cell_pos]

                    # 格式化值为TypeScript代码字符串
                    formatted_value = self.type_handler.format_value_for_ts(
                        value, value_type, color_code)
                    # 添加到当前行的字段列表，格式为"字段名: 值"
                    row_entries.append(f'        {key}: {formatted_value}')

                # 如果行有数据，将所有字段组装为一个对象字面量
                if row_entries:
                    # 使用大括号包裹所有字段，每个字段占一行，用逗号分隔
                    data_entries.append(
                        f'    {{\n{",\n".join(row_entries)}\n    }}')

            # 开始组装最终的TypeScript代码
            # 文件头注释
            ts_code = ['// This file is auto-generated from Excel data', '']

            # 添加导入语句
            if imports:
                ts_code.extend(imports)  # 添加多个导入语句
                ts_code.append('')  # 添加空行分隔

            # 添加接口键定义（常量对象）
            ts_code.extend([
                f'export const {interface_keys_name} = [',  # 常量对象开始
                ','.join('"' + interface_keys + '"'),  # 所有键定义，逗号分隔
                '];',  # 常量对象结束
                ''  # 空行分隔
            ])

            # 添加接口定义（数据结构定义）
            ts_code.extend([
                f'export interface {interface_name} {{',  # 接口定义开始
                '    [key: string]: {',
                '\n    '.join(interface_props),  # 所有属性定义，换行分隔
                '    }',
                '}',  # 接口定义结束
                ''  # 空行分隔
            ])

            # 添加数据数组定义（用于存储从Excel导入的数据）
            ts_code.extend([
                f'export const {data_name}: {interface_name} = {{',  # 数组定义开始，指定类型为接口数组
                ',\n'.join(data_entries),  # 所有数据项，逗号分隔
                '};',  # 数组定义结束
                ''  # 空行分隔
            ])

            # 添加类定义（用于封装数据和相关方法）
            ts_code.extend([
                f'export class {class_name} {{',  # 类定义开始
                '    static Start() {',  # Start方法定义
                '        //Start方法，用于初始化数据'
            ])

            # 如果有其他代码，添加到Start方法中
            if other_code:
                # 添加所有其他代码行，每行前加缩进
                ts_code.append('        ' + '\n        '.join(other_code))

            # 完成类定义
            ts_code.extend([
                '    }',  # Start方法结束
                '}',  # 类定义结束
                ''  # 文件末尾空行
            ])

            # 写入文件
            # 确保输出目录存在，如果不存在则创建
            os.makedirs(output_dir, exist_ok=True)
            # 构造输出文件路径：输出目录 + 文件名
            output_file = os.path.join(output_dir, f"xlsx_{excel_name}.ts")

            # 检查是否存在同名文件，如果存在则删除
            if os.path.exists(output_file):
                try:
                    # 删除已存在的文件以确保完全替换
                    os.remove(output_file)
                    self.logger.info(f"已删除已存在的文件: {output_file}")
                except Exception as remove_error:
                    self.logger.warning(
                        f"删除已存在文件时出错: {str(remove_error)}，将尝试直接覆盖")

            # 打开文件并写入内容
            with open(output_file, 'w', encoding='utf-8') as f:
                # 将所有代码行连接成一个字符串，每行以换行符分隔
                f.write('\n'.join(ts_code))

            # 记录成功日志
            self.logger.info(f"成功生成TypeScript文件: {output_file}")
            # 返回生成的文件路径
            return output_file

        except Exception as e:
            # 捕获并记录任何异常
            self.logger.error(f"生成TypeScript文件时出错: {str(e)}")
            # 重新抛出异常，让调用者知道发生了错误
            raise
