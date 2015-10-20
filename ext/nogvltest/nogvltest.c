#include "nogvltest.h"

VALUE rb_mNogvltest;


static VALUE rb_mNogvltest_run_loop()
{
  int i = 0;
  while(1) { i += 1; }
  return Qnil;
}

static VALUE rb_mNogvltest_run_loop_without_gvl()
{
#ifdef CALL_WITHOUT_GVL
  return (VALUE)CALL_WITHOUT_GVL((void *)(rb_blocking_function_t *)rb_mNogvltest_run_loop, NULL, NULL, NULL);
#else
  return rb_mNogvltest_run_loop();
#endif
}

void
Init_nogvltest(void)
{
  rb_mNogvltest = rb_define_module("Nogvltest");
  rb_define_singleton_method(rb_mNogvltest, "run_loop", rb_mNogvltest_run_loop, 0);
  rb_define_singleton_method(rb_mNogvltest, "run_loop_without_gvl", rb_mNogvltest_run_loop_without_gvl, 0);
}
