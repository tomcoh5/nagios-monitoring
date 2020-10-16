#!/usr/bin/python
from __future__ import print_function
import psutil
import sys
load = psutil.cpu_percent()

if load < "85.0":
        print("Okay - " + str(load) +" cpu used.")
        sys.exit(0)
elif load == "85.0":
        print("Warning - " + str(load) +" of cpu used")
        sys.exit(1)
elif load > "85.0":
        print("Critical - " + str(load) +" of cpu used")
        sys.exit(2)
else:
        print("UNKOWN " + str(load) + " of cpu used")
        sys.exit(3)
