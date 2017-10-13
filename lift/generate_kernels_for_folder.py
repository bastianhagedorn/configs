#!/bin/python3

import os
import sys
import subprocess

if not len(sys.argv) == 3:
    print("Provide path to folder and high-level filename")
    sys.exit()

def printBlue( string ):
    print ('\033[95m' + string + '\033[0m')
    return

folder = sys.argv[1]
filename = sys.argv[2]

printBlue("[INFO] Processing file " + filename)
for config in os.listdir(folder):
    if config.endswith(".json"):
        printBlue("[INFO] Using config " + config)
        highLevelFile = folder + "/" + filename 
        configPath = folder + "/" + config

        # generate kernels for each config
        subprocess.check_call(['generate_kernels.sh', str(highLevelFile), str(configPath)])
