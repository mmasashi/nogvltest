#!/bin/bash

PJ_HOME="$( cd "$( dirname "$0" )/.." && pwd )"
bundle exec ruby sample/run_once_bench.rb $*
