#!/bin/bash

PJ_HOME="$( cd "$( dirname "$0" )/.." && pwd )"
ps aux|grep "sample/run_threads.rb"|grep -v grep|awk '{print $2}'|xargs kill -9
ps aux|grep "sample/run_once_bench.rb"|grep -v grep|awk '{print $2}'|xargs kill -9
