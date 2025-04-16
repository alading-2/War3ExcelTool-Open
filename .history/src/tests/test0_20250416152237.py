import os

recursive=True
input_dir = "C:/Users"
patterns = [
        os.path.join(input_dir, "**" if recursive else "", ext)
        for ext in ["*.xls", "*.xlsx"]
    ]