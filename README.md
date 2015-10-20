# Nogvltest

This project is for testing `rb_thread_call_without_gvl` method which unlocks GVL(Global VM Lock).
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
