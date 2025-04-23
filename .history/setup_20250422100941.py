import os
import setuptools
from src.utils.project_info import project_info  # 导入项目信息

path = "requirements.txt"
# 读取requirements.txt文件
with open(path) as f:
    requirements = f.read().splitlines()

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

setuptools.setup(
    name=project_info.name,
    version=project_info.version,
    description=project_info.description,
    long_description=long_description,
    long_description_content_type="text/markdown",
    author=project_info.author,
    # 自动查找项目根目录下所有包含 __init__.py 的文件夹作为包
    packages=setuptools.find_packages(),
    include_package_data=True,
    install_requires=requirements,
    entry_points={
        "console_scripts": [
            "excel_to_ts=src.main:main",
        ],
    },
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.7",
)
