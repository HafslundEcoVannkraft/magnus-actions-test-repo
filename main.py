#!/bin/python
import os
import sys

print(os.path.realpath(__file__))
print(' '.join([s for s in sys.argv]))
print(f"https://github.com/{os.environ['GITHUB_REPOSITORY']}/blob/{os.environ['branch']}/")