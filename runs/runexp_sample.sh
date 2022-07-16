#!/bin/bash

# 15 minutes time limit
timelimit=900
# 10GB memory limit
memlimit=10240
#runlim options
run_opt="--real-time-limit=${timelimit} --space-limit=${memlimit} --kill"

#SOURCE="$(dirname "${BASH_SOURCE[0]}")"
FILEFULL="$(realpath $0)"
PWDFULL="$(realpath $PWD)"
RUNDIR="$(dirname "$FILEFULL")"
ROOTDIR="$(dirname "$RUNDIR")"
LOGDIR="${ROOTDIR}/logs"
AIGDIR="${ROOTDIR}/aig"
PDTDIR="${ROOTDIR}/bin"
PDTRAV="${ROOTDIR}/bin/pdtrav"
RUNLIM="${ROOTDIR}/bin/runlim"

echo "run: $RUNDIR pwd: $ROOTDIR aig: $AIGDIR pdtrav: $PDTRAV"
#PDTRAV



#zipcpu

MODELS2=("pfcache16" "pfcache28")


for m in ${MODELS2[@]}; do
         AIG="${AIGDIR}/zipcpu/${m}.aig"
         LOG="${LOGDIR}/${m}.log" 
         PDTOPT="-strategy igrhwmcc"
         cmd="$RUNLIM $run_opt $PDTRAV $PDTOPT -verbosity 4 ${AIG}"
         echo "running: $cmd >& $LOG"
         ($cmd) >& $LOG
done

