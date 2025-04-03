import os
from setuptools import setup, find_packages

path = os.path.dirname(__file__)
path = (f"{path}/requirements.txt")
# 读取requirements.txt文件
with open(path) as f:
    requirements = f.read().splitlines()

setup(
    name="excel_to_ts",
    version="1.0.0",
    description="Excel到TypeScript转换工具",
    author="Python高级工程师",
    packages=find_packages(),
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
    ],
    python_requires=">=3.7",
) 