#ifndef NOGVLTEST_H
#define NOGVLTEST_H 1

#include "ruby.h"


/* Ruby 2.0+ */
#if defined(HAVE_RUBY_THREAD_H) && defined(HAVE_RB_THREAD_CALL_WITHOUT_GVL)
#include <ruby/thread.h>
typedef void *(*my_blocking_fn_t)(void*);
#define CALL_WITHOUT_GVL(fn,a,ubf,b) rb_thread_call_without_gvl((fn),(a),(ubf),(b))

/* Ruby 1.9 */
#elif defined(HAVE_RB_THREAD_BLOCKING_REGION)
typedef void *(*my_blocking_fn_t)(void*);
#define CALL_WITHOUT_GVL(fn,a,ubf,b) rb_thread_blocking_region((my_blocking_fn_t)(fn),(a),(ubf),(b))

/* Ruby 1.8 */
#else
#pragma message("The function which disables GVL is not supported on your Ruby version.")
#endif


#endif /* NOGVLTEST_H */
