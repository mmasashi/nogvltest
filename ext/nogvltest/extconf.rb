require "mkmf"

# 2.0+
have_header('ruby/thread.h') && have_func('rb_thread_call_without_gvl', 'ruby/thread.h')
# 1.9-only
have_func('rb_thread_blocking_region')

create_makefile("nogvltest/nogvltest")

