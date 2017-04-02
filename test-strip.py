import psutil
from subprocess import Popen

for process in psutil.process_iter():
    if process.cmdline == ['python', 'StripCore.py']:
        print('Process found. Terminating it.')
        process.terminate()
        break
else:
    print('Process not found: starting it.')
    Popen(['python', 'StripCore.py'])
