require 'nogvltest/nogvltest'
require 'optparse'
require 'benchmark'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: run_once_bench.rb [options]"
  opts.on("-n", "--num-threads NUM_THREADS", "Number of threads") do |v|
    options[:num_threads] = v.to_i
  end
  opts.on("-g", "--with-gvl", "Run loop with GVL") do |v|
    options[:gvl] = true
  end
  opts.on("-l", "--num-loop NUM_LOOP", "with GVL") do |v|
    options[:num_loop] = v.to_i
  end
end.parse!

num_threads = if ARGV[0]
                ARGV[0].to_i
              elsif options[:num_threads]
                options[:num_threads].to_i
              else
                1
              end
#method = options[:gvl] ? :run_once : :run_once_without_gvl
num_loop = options[:num_loop] ? options[:num_loop] : 1000000

puts "Start running once bench... num_threads:#{num_threads} num_loop:#{num_loop}"

Benchmark.bm do |x|
  x.report(:with_gvl) {
    num_threads.times.map{ Thread.new{ num_loop.times{Nogvltest.run_once}} }.each(&:join)
  }
  x.report(:without_gvl) {
    num_threads.times.map{ Thread.new{ num_loop.times{Nogvltest.run_once_without_gvl}} }.each(&:join)
  }
end
