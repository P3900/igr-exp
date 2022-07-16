#!/bin/bash

# 2 hours time limit
timelimit=7200
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


#hwmcc2017

MODELS=("oc8051gmecacc" "oc8051gmadacc")

for m in ${MODELS[@]}; do
         AIG="${AIGDIR}/hwmcc2017/${m}.aig"
         LOG="${LOGDIR}/${m}.log" 
         PDTOPT="-strategy igra1e -igrSide 0"
         cmd="$RUNLIM $run_opt $PDTRAV $PDTOPT -verbosity 4 ${AIG}"
         echo "running: $cmd >& $LOG"
         ($cmd) >& $LOG
done

MODELS=("6s366r")

for m in ${MODELS[@]}; do
         AIG="${AIGDIR}/hwmcc2017/${m}.aig"
         LOG="${LOGDIR}/${m}.log" 
         PDTOPT="-strategy igrhwmcc"
         cmd="$RUNLIM $run_opt $PDTRAV $PDTOPT -verbosity 4 ${AIG}"
         echo "running: $cmd >& $LOG"
         ($cmd) >& $LOG
done

#hwmcc2020

MODELS=("VexRiscv-regch0-30-p1.aig")

for m in ${MODELS[@]}; do
         AIG="${AIGDIR}/hwmcc2020/${m}.aig"
         LOG="${LOGDIR}/${m}.log" 
         PDTOPT="-strategy igrhwmcc"
         cmd="$RUNLIM $run_opt $PDTRAV $PDTOPT -verbosity 4 ${AIG}"
         echo "running: $cmd >& $LOG"
         ($cmd) >& $LOG
done

#zipcpu

MODELS1=("dcache018" "dcache019" "dcache021"
         "pfcache17" "zipcpu223" "zipmmu20");

MODELS2=("dcache022" 
         "pfcache10" "pfcache11" "pfcache15" "pfcache16"
         "pfcache18" "pfcache27" "pfcache28" 
         "zipmmu10" "zipmmu14"
         "zipcpu220" "zipcpu226" "zipcpu301");

MODELS3=("dcache022");

for m in ${MODELS1[@]}; do
         AIG="${AIGDIR}/zipcpu/${m}.aig"
         LOG="${LOGDIR}/${m}.log" 
         PDTOPT="-strategy itphwmcc"
         cmd="$RUNLIM $run_opt $PDTRAV $PDTOPT -verbosity 4 ${AIG}"
         echo "running: $cmd >& $LOG"
         ($cmd) >& $LOG
done

for m in ${MODELS2[@]}; do
         AIG="${AIGDIR}/zipcpu/${m}.aig"
         LOG="${LOGDIR}/${m}.log" 
         PDTOPT="-strategy igrhwmcc"
         cmd="$RUNLIM $run_opt $PDTRAV $PDTOPT -verbosity 4 ${AIG}"
         echo "running: $cmd >& $LOG"
         ($cmd) >& $LOG
done

for m in ${MODELS3[@]}; do
         AIG="${AIGDIR}/zipcpu/${m}.aig"
         LOG="${LOGDIR}/${m}.log" 
         PDTOPT="-strategy igra1ie -verbosity 4 -igrSide 1 -itpDrup 1"
         cmd="$RUNLIM $run_opt $PDTRAV $PDTOPT -verbosity 4 ${AIG}"
         echo "running: $cmd >& $LOG"
         ($cmd) >& $LOG
done

