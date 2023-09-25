import os
import sys

def print_file_path():
    print("lib.py: print_file_path()")
    file_path = sys.argv[0]
    dirname = os.environ['GITHUB_WORKSPACE']
    relative_file_path = os.path.relpath(file_path, dirname)
    print(f"https://github.com/{os.environ['GITHUB_REPOSITORY']}/blob/{os.environ['branch']}/{relative_file_path}")