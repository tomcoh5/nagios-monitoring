#!/usr/bin/python
import subprocess
import sys
from datetime import datetime
today = datetime.now()
obj= today.strftime("%d/%b/%Y:%H:%M")
amount_of_post=os.popen("find /var/log/apache2/domlogs/  -type f -exec cat {} + | grep POST | grep " + obj + " | wc -l").read()
amount_of_post = int(amount_of_post)
if  amount_of_post  < 300:
        print("Ok - post request " +  str(amount_of_post))
        sys.exit(0)

elif   amount_of_post >  300:
        print("Warning - post requests  " + str(amount_of_post))
        sys.exit(1)

elif  amount_of_post  > 600:
        print("Critical  - post request " + str(amount_of_post))
        sys.exit(2)
else:
        print("Unknown amount of requests")
        sys.exit(3)
