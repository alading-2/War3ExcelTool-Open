import os  # 导入操作系统模块，用于处理文件路径
import sys  # 导入系统模块，用于访问与Python解释器和系统相关的变量和函数
import os
import sys
import argparse
from typing import Dict, Any

# Conditional import for GUI mode
app = None
MainWindow = None
try:
    from PyQt5.QtWidgets import QApplication
    from src.ui.main_window import MainWindow
except ImportError:
    # Allow running in CLI mode even if PyQt5 is not installed
    pass

from src.utils.logger import setup_logger
from src.utils.config_manager import ConfigManager # Keep for potential default values
# Import processor function when needed
# from src.core.processor import process_files

def parse_args():
    """解析命令行参数."""
    parser = argparse.ArgumentParser(
        description="War3ExcelTool: Convert Excel files to TS, Lua, Ini and vice versa.",
        formatter_class=argparse.RawTextHelpFormatter, # Use RawTextHelpFormatter for better control
        epilog="""
Examples:
  # Convert all Excel files in 'input_excel' to TS and Lua in 'output_dir'
  python src/main.py -i input_excel -o output_dir --to-ts --to-lua

  # Convert specific INI file 'data.ini' to Excel in 'output_dir/excel'
  python src/main.py --ini-input data.ini -o output_dir --ini-to-excel

  # Run in GUI mode (no conversion arguments)
  python src/main.py
"""
    )

    # --- Input/Output Arguments ---
    # These arguments trigger CLI mode if present
    parser.add_argument(
        "-i",
        "--input",
        metavar="PATH",
        help="Excel input directory/file path (for Excel->* conversions)."
    )
    parser.add_argument(
        "-o",
        "--output",
        metavar="PATH",
        help="Base output directory (required for any conversion in CLI mode)."
    )
    parser.add_argument(
        "-ii",
        "--ini-input",
        metavar="PATH",
        help="Ini input directory/file path (for Ini->Excel conversion)."
    )

    # --- Conversion Type Flags ---
    # These arguments trigger CLI mode if present
    parser.add_argument(
        "--to-ts",
        action="store_true",
        help="Enable Excel -> TypeScript conversion."
    )
    parser.add_argument(
        "--to-lua",
        action="store_true",
        help="Enable Excel -> Lua conversion."
    )
    parser.add_argument(
        "--to-ini",
        action="store_true",
        help="Enable Excel -> Ini conversion."
    )
    parser.add_argument(
        "--ini-to-excel",
        action="store_true",
        help="Enable Ini -> Excel conversion."
    )

    # --- General Options ---
    parser.add_argument(
        "--log-level",
        choices=["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"],
        default="INFO",
        help="Set the logging level."
    )
    # Add other potential CLI options here if needed later, e.g.:
    # parser.add_argument(
    #     "--template-path",
    #     metavar="PATH",
    #     help="Path to custom TS template file (overrides config)."
    # )
    # parser.add_argument(
    #     "-r", "--recursive", action="store_true", 
    #     help="Recursively search for input files (applies to -i and --ini-input)."
    # )

    return parser.parse_args()

def closesplash():
    """关闭 PyInstaller 加载画面."""
    try:
        import pyi_splash
        pyi_splash.close()
    except ImportError:
        pass # Not running from PyInstaller bundle
    except Exception as e:
        # Log potential errors during splash closing, but don't crash
        print(f"Error closing splash screen: {e}")

def main():
    """程序入口点: 根据参数选择 CLI 或 GUI 模式."""
    args = parse_args()

    # --- Setup Logger --- 
    # Use log level from args if provided, otherwise default
    log_level = args.log_level
    user_home = os.path.expanduser("~")
    log_dir = os.path.join(user_home, ".war3exceltool", "logs")
    logger = setup_logger(log_dir, log_level)

    # --- Determine Run Mode --- 
    # Any conversion-specific argument triggers CLI mode.
    is_cli_mode = bool(
        args.input or 
        args.output or # Output is mandatory for CLI
        args.ini_input or 
        args.to_ts or 
        args.to_lua or 
        args.to_ini or 
        args.ini_to_excel
    )

    # --- Execute Based on Mode --- 
    if is_cli_mode:
        logger.info("Running in Command-Line Interface (CLI) mode.")
        closesplash() # Close splash screen immediately for CLI

        # --- CLI Argument Validation ---
        if not args.output:
            logger.error("Error: Base output directory (-o/--output) is required for CLI mode.")
            parser.print_help()
            sys.exit(1)
        if (args.to_ts or args.to_lua or args.to_ini) and not args.input:
            logger.error("Error: Excel input path (-i/--input) is required for Excel->* conversions.")
            parser.print_help()
            sys.exit(1)
        if args.ini_to_excel and not args.ini_input:
             logger.error("Error: Ini input path (--ini-input) is required for Ini->Excel conversion.")
             parser.print_help()
             sys.exit(1)
        if not (args.to_ts or args.to_lua or args.to_ini or args.ini_to_excel):
            logger.error("Error: At least one conversion type (--to-ts, --to-lua, --to-ini, --ini-to-excel) must be specified for CLI mode.")
            parser.print_help()
            sys.exit(1)

        # --- Build Config for Processor --- 
        # Start with defaults from config file if needed, then override with args
        # config_manager = ConfigManager() # Load defaults if necessary
        # base_config = config_manager.get_all_config()
        config = {
            # Paths
            "input_path": os.path.abspath(args.input) if args.input else "",
            "output_path": os.path.abspath(args.output), # Output path is mandatory and absolute
            "ini_input_path": os.path.abspath(args.ini_input) if args.ini_input else "",
            # Conversion Flags
            "convert_to_ts": args.to_ts,
            "convert_to_lua": args.to_lua,
            "convert_to_ini": args.to_ini,
            "convert_ini_to_excel": args.ini_to_excel,
            # Other settings (get from config or use defaults/args)
            # "recursive": args.recursive or base_config.get("recursive", True),
            # "template_path": args.template_path or base_config.get("template_path", ""),
            "log_level": log_level,
            # Add any other necessary config keys here
        }

        # --- Run Core Processor --- 
        try:
            # Import here to avoid dependency if running GUI only
            from src.core.processor import process_files 
            results = process_files(config)
            logger.info(f"CLI processing finished. Processed: {results.get('processed', 0)}, Skipped: {results.get('skipped', 0)}, Errors: {results.get('errors', 0)}")
            # Exit with error code if errors occurred
            sys.exit(1 if results.get("errors", 0) > 0 else 0)
        except ImportError as e:
            logger.error(f"Error importing core processor. Ensure core modules exist: {e}", exc_info=True)
            sys.exit(1)
        except Exception as e:
            logger.error(f"An unexpected error occurred during CLI processing: {e}", exc_info=True)
            sys.exit(1)

    else:
        # --- GUI Mode --- 
        logger.info("No specific conversion arguments provided, attempting to run in GUI mode.")
        
        if QApplication is None or MainWindow is None:
            logger.error("GUI components (PyQt5) not found or failed to import. Cannot start GUI mode.")
            logger.error("Please install PyQt5: pip install PyQt5")
            sys.exit(1)

        closesplash() # Close splash only when GUI is confirmed to start
        
        try:
            app = QApplication(sys.argv)
            app.setApplicationName("War3ExcelTool")
            # MainWindow will load its own config from file via ConfigManager
            main_window = MainWindow()
            main_window.show()
            sys.exit(app.exec_())
        except Exception as e:
            logger.error(f"An error occurred while starting the GUI: {e}", exc_info=True)
            sys.exit(1)


# 这个条件判断确保只有直接运行此文件时才会执行main()函数
# 如果这个文件被作为模块导入，则不会执行main()
if __name__ == "__main__":
    main()  # 调用主函数开始程序执行
