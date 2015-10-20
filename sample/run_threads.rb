require 'nogvltest/nogvltest'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: run_threads.rb [options] [num_threads(default: 1)]"
  opts.on("-g", "--with-gvl", "Run loop with GVL") do |v|
    options[:gvl] = true
  end
end.parse!
num_threads = ARGV[0] ? ARGV[0].to_i : 1
method = options[:gvl] ? :run_loop : :run_loop_without_gvl

puts "Start running loop... num_threads:#{num_threads} gvl:#{!!options[:gvl]}"
num_threads.times.map{ Thread.new{Nogvltest.send(method)} }.each(&:join)
