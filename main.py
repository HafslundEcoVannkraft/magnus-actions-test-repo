#!/bin/python
import os
import sys
from lib import print_file_path

print(os.path.realpath(__file__))
print(' '.join([s for s in sys.argv]))
print_file_path()
#print(f"https://github.com/{os.environ['GITHUB_REPOSITORY']}/blob/{os.environ['branch']}/")