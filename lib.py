import os
import sys

def print_file_path():
    print("lib.py: print_file_path()")
    print(os.path.realpath(__file__))
    print(' '.join([s for s in sys.argv]))