import os
import sys
import argparse
import traceback
from typing import List, Optional
from src.core.excel_to_ts import ExcelToTypeScript


def parse_arguments() -> argparse.Namespace:
    """
    Parse command line arguments.
    
    Returns:
        argparse.Namespace: Parsed command line arguments
    """
    parser = argparse.ArgumentParser(
        description="Convert Excel files to TypeScript interfaces and constants"
    )
    
    parser.add_argument(
        "excel_file",
        type=str,
        help="Path to the Excel file to convert"
    )
    
    parser.add_argument(
        "-o", "--output-dir",
        type=str,
        default="ts_output",
        help="Directory where the TypeScript files will be saved (default: ts_output)"
    )
    
    parser.add_argument(
        "-v", "--verbose",
        action="store_true",
        help="Enable verbose output"
    )
    
    return parser.parse_args()


def main():
    """Main entry point for the Excel to TypeScript converter."""
    try:
        args = parse_arguments()
        
        # Get absolute paths
        excel_file = os.path.abspath(args.excel_file)
        output_dir = os.path.abspath(args.output_dir)
        
        if args.verbose:
            print(f"Excel file: {excel_file}")
            print(f"Output directory: {output_dir}")
        
        # Create the converter
        converter = ExcelToTypeScript()
        
        # Convert the Excel file
        generated_files = converter.convert_excel_to_ts(excel_file, output_dir)
        
        # Print the results
        print(f"Successfully generated {len(generated_files)} TypeScript files:")
        for file_path in generated_files:
            print(f"  - {os.path.relpath(file_path, os.getcwd())}")
        
        return 0
    
    except FileNotFoundError as e:
        print(f"Error: {str(e)}")
        return 1
    
    except Exception as e:
        print(f"Error: {str(e)}")
        if 'args' in locals() and args.verbose:
            print(traceback.format_exc())
        return 1


if __name__ == "__main__":
    sys.exit(main()) 