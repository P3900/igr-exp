# IGR - Experiments

```
./bin
```
The `./bin` directory contains `pdtrav` (static executable), plus `runlim` (a program used to run an executable under space and time limits).

```
./runs
```
the `./runs` directory holds two bash scripts conceived to run pdtrav on a set of benchmarks from the `./aig` directory.
In order to check that everything works, we suggest:

```
cd runs
./runexpEasy.sh
```

then you can run

```
./runexp.sh
```

`.pdtrav.out` files are going to contain the result of runs (and the counterexample in aiger format). 
The present benchmarks are all UNSAT, so you can simply remove the `.out` files.

```
./logs
```
the directory is going to contain log files from pdtrav runs.

```
./logs.ref
```
The directory contains some examples of logs from previously run problems: to be used to check that things work. 
So far this is a manual check, so no automated regression test is in place.

