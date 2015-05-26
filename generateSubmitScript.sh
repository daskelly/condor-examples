#!/bin/bash

# This is a script which generates a condor submit script

printf "# This file was created by calling $0 $ARGS on `hostname` on `date` in `pwd`\n"
printf "executable    = FILL_ME_IN\n"
printf "universe      = vanilla\n"
printf "getenv        = True\n"
printf "notification  = Never\n"

LOG_DIR=condor_logs
mkdir -p $LOG_DIR

for FILE in dir/*.txt
do
    printf "\narguments = arg1 arg2 arg3\n"
    printf "error      = $LOG_DIR/job.\$(Cluster).\$(Process).err\n"
    printf "output     = $LOG_DIR/job.\$(Cluster).\$(Process).out\n"
    printf "log		= $LOG_DIR/job.\$(Cluster).\$(Process).log\n"
    printf "queue\n"
done
