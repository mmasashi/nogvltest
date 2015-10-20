# Nogvltest

This project is for testing `rb_thread_call_without_gvl` method which unlocks GVL(Global VM Lock).


## CPU usage without GVL

With this project, you can confirm that the CPU usage is different between with GVL and without GVL.
Here is the example, running this script on the ec2 c3.xlarg instance.

```
# Run 4 threads with GVL (bin/run_threads.sh -g 4)
%Cpu0  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu1  :100.0 us,  0.0 sy,  0.0 ni,  0.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu2  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu3  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st

# Run 4 threads without GVL (bin/run_threads.sh 4)
%Cpu0  :100.0 us,  0.0 sy,  0.0 ni,  0.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu1  :100.0 us,  0.0 sy,  0.0 ni,  0.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu2  :100.0 us,  0.0 sy,  0.0 ni,  0.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu3  :100.0 us,  0.0 sy,  0.0 ni,  0.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
```

## GVL Cost

However, there seem to be some costs for releasing GVL.

```
# Run 2 threads (bin/run_once_bench.sh -n 2)
Start running once bench... num_threads:2 num_loop:1000000
       user     system      total        real
with_gvl  0.120000   0.000000   0.120000 (  0.118881)
without_gvl  3.020000   0.310000   3.330000 (  1.962553)


# Run 4 threads (bin/run_once_bench.sh -n 4)
Start running once bench... num_threads:4 num_loop:1000000
       user     system      total        real
with_gvl  0.240000   0.000000   0.240000 (  0.235062)
without_gvl 40.140000  25.220000  65.360000 ( 23.637988)
```


# How to run

## Start running a process

- Clone this project into your local
- Change the current directory to the project home and run the following commands.

```
# Install dependencies
bundle install

# Build c-extension
bundle exec rake build

# Run threads (2 threads)
./bin/run_threads.sh 2
```

## Stop the processes

```
./bin/kill_process.sh
```
