require 'nogvltest/nogvltest'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: run_threads.rb [options]"
  opts.on("-n", "--num-threads NUM_THREADS", "Number of threads") do |v|
    options[:num_threads] = v.to_i
  end
  opts.on("-g", "--with-gvl", "Run loop with GVL") do |v|
    options[:gvl] = true
  end
end.parse!
num_threads = if ARGV[0]
                ARGV[0].to_i
              elsif options[:num_threads]
                options[:num_threads].to_i
              else
                1
              end
method = options[:gvl] ? :run_loop : :run_loop_without_gvl

puts "Start running loop... num_threads:#{num_threads} gvl:#{!!options[:gvl]}"
num_threads.times.map{ Thread.new{Nogvltest.send(method)} }.each(&:join)
