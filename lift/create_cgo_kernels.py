#!/bin/python3
import time
import os
import subprocess

def printBlue( string ):
    print ('\033[95m' + string + '\033[0m')
    return

folder = "kernels-" + time.strftime("%d-%m-%Y-%H:%M")
cgo = "/home/bastian/development/lift/highLevel/stencil/cgo/ppcg"

os.makedirs(folder)
os.chdir(folder)

# go into all expression folders
for expression in os.listdir(cgo):
    highLevelDir = cgo + "/" + expression
    if os.path.isdir(highLevelDir):

        printBlue("[INFO] Processing " + expression)
        os.makedirs(expression)
        os.chdir(expression)

        subprocess.check_call(['generate_kernels_for_folder.py', str(highLevelDir)])
        
        # handle special cases e.g., with modified input sizes
        for special in os.listdir(highLevelDir):
            specialDir = cgo + "/" + expression + "/" + special
            if os.path.isdir(specialDir):
                subprocess.check_call(['generate_kernels_for_folder.py', str(specialDir)])

        # process next high-level expression
        os.chdir("..")
