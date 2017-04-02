from os import getpid
from sys import argv, exit
import psutil  ## pip install psutil

myname = argv[0]
mypid = getpid()
for process in psutil.process_iter():
    if process.pid != mypid:
        for path in process.cmdline():
            if myname in path:
                print "process found"
                process.terminate()
                exit()
