#!/usr/bin/env python
import os, sys
from datetime import datetime
import shutil

indir="/Volumes/NO NAME/DATA/H00"
for path, dirs, files in os.walk(indir):
    for f in files:
        srcpath = os.path.join(path, f)
        print srcpath
        ctime = os.stat(srcpath).st_ctime
        date = datetime.fromtimestamp(ctime)
        date_str = date.strftime("%Y%m%d")
        if not os.path.isdir(date_str):
            os.mkdir(date_str)
        dstpath = os.path.join(date_str, f)
        shutil.move(srcpath, dstpath)

