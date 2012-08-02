from time import sleep
import subprocess
import os
outdir = 'screencapture'
counter = 1
def capture():
    global counter
    filename = '%08d.png' % counter
    outpath = os.path.join(outdir, filename)
    subprocess.call(['screencapture', outpath])
    counter += 1

while True:
    capture()
    sleep(10)
