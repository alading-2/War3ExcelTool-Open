import os
import pandas as pd
from typing import List, Dict, Any, Optional, Tuple
import traceback
from src.core.data_handler import ExcelTable


class ExcelToTypeScript:
    """
    A class to convert Excel data to TypeScript interfaces and constant data.
    
    This class uses the ExcelTable class to handle Excel data and generates
    TypeScript code based on the structure and content of the Excel file.
    """
    
    def __init__(self):
        """Initialize the ExcelToTypeScript converter."""
        pass
    
    def convert_excel_to_ts(self, excel_file_path: str, output_dir: str) -> List[str]:
        """
        Convert an Excel file to TypeScript interfaces and constants.
        
        Args:
            excel_file_path (str): Path to the Excel file to convert
            output_dir (str): Directory where the TypeScript files will be saved
            
        Returns:
            List[str]: List of generated TypeScript file paths
            
        Raises:
            FileNotFoundError: If the Excel file doesn't exist
            ValueError: If there's an error processing the Excel file
        """
        try:
            # Check if the Excel file exists
            if not os.path.exists(excel_file_path):
                raise FileNotFoundError(f"Excel file not found: {excel_file_path}")
            
            # Check if the output directory exists, create if not
            os.makedirs(output_dir, exist_ok=True)
            
            # Read all sheets from the Excel file
            xl = pd.ExcelFile(excel_file_path)
            sheet_names = xl.sheet_names
            
            generated_files = []
            
            # Process each sheet
            for sheet_name in sheet_names:
                # Read the sheet data
                df = pd.read_excel(excel_file_path, sheet_name=sheet_name, header=None)
                
                # Create an ExcelTable instance
                excel_table = ExcelTable(df)
                
                # Generate TypeScript interface
                interface_code = self._generate_interface(sheet_name, excel_table)
                
                # Generate TypeScript constant data
                constants_code = self._generate_constants(sheet_name, excel_table)
                
                # Save the TypeScript files
                base_filename = self._sanitize_filename(sheet_name)
                
                # Save interface
                interface_file_path = os.path.join(output_dir, f"{base_filename}.interface.ts")
                with open(interface_file_path, "w", encoding="utf-8") as f:
                    f.write(interface_code)
                generated_files.append(interface_file_path)
                
                # Save constants
                constants_file_path = os.path.join(output_dir, f"{base_filename}.data.ts")
                with open(constants_file_path, "w", encoding="utf-8") as f:
                    f.write(constants_code)
                generated_files.append(constants_file_path)
                
            return generated_files
            
        except Exception as e:
            error_msg = f"Error converting Excel to TypeScript: {str(e)}\n{traceback.format_exc()}"
            raise ValueError(error_msg)
    
    def _sanitize_filename(self, name: str) -> str:
        """
        Convert a sheet name to a valid file name.
        
        Args:
            name (str): The sheet name to sanitize
            
        Returns:
            str: A sanitized file name
        """
        # Replace spaces and special characters with underscores
        sanitized = "".join(c if c.isalnum() else "_" for c in name)
        
        # Convert to camelCase
        parts = sanitized.split("_")
        sanitized = parts[0].lower() + "".join(p.capitalize() for p in parts[1:] if p)
        
        return sanitized
    
    def _generate_interface(self, sheet_name: str, excel_table: ExcelTable) -> str:
        """
        Generate TypeScript interface from Excel data.
        
        Args:
            sheet_name (str): Name of the Excel sheet
            excel_table (ExcelTable): ExcelTable instance containing the data
            
        Returns:
            str: TypeScript interface code
        """
        # Convert sheet name to PascalCase for interface name
        interface_name = "".join(word.capitalize() for word in sheet_name.split())
        
        # Start with the interface declaration
        ts_code = [
            "// Auto-generated TypeScript interface",
            f"export interface {interface_name} {{",
        ]
        
        # Add properties for each column
        for key, column_info in excel_table.get_all_column_info().items():
            # Add JSDoc comment if available
            if column_info.comment:
                ts_code.append(f"  /** {column_info.comment} */")
            
            # Add the property with its type (use 'any' as default)
            ts_type = getattr(column_info, 'type', 'any')
            ts_code.append(f"  {key}: {ts_type};")
        
        # Close the interface
        ts_code.append("}")
        
        # Return the code as a string
        return "\n".join(ts_code)
    
    def _generate_constants(self, sheet_name: str, excel_table: ExcelTable) -> str:
        """
        Generate TypeScript constants from Excel data.
        
        Args:
            sheet_name (str): Name of the Excel sheet
            excel_table (ExcelTable): ExcelTable instance containing the data
            
        Returns:
            str: TypeScript constants code
        """
        # Convert sheet name to PascalCase for type name and camelCase for variable name
        type_name = "".join(word.capitalize() for word in sheet_name.split())
        var_name = type_name[0].lower() + type_name[1:] + "Data"
        
        # Start with the import statement and constant declaration
        ts_code = [
            "// Auto-generated TypeScript constants",
            f"import {{ {type_name} }} from './{self._sanitize_filename(sheet_name)}.interface';",
            "",
            f"export const {var_name}: {type_name}[] = [",
        ]
        
        # Add each row as an object
        for idx, row in excel_table.iterrows():
            # Start the object
            ts_code.append("  {")
            
            # Add properties for each column
            for key in excel_table.get_all_column_info().keys():
                value = row[key]
                
                # Format the value based on its type
                if value is None:
                    formatted_value = "null"
                elif isinstance(value, bool):
                    formatted_value = str(value).lower()
                elif isinstance(value, (int, float)):
                    formatted_value = str(value)
                else:
                    # Escape special characters and wrap in quotes
                    formatted_value = f'"{str(value).replace('"', '\\"')}"'
                
                ts_code.append(f'    {key}: {formatted_value},')
            
            # Close the object
            ts_code.append("  },")
        
        # Close the array and export
        ts_code.append("];")
        
        # Return the code as a string
        return "\n".join(ts_code)


# Example usage:
if __name__ == "__main__":
    converter = ExcelToTypeScript()
    excel_path = "example.xlsx"
    output_dir = "ts_output"
    
    try:
        generated_files = converter.convert_excel_to_ts(excel_path, output_dir)
        print(f"Generated {len(generated_files)} TypeScript files:")
        for file_path in generated_files:
            print(f"  - {file_path}")
    except Exception as e:
        print(f"Error: {str(e)}") 