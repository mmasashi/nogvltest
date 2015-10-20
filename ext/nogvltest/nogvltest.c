#include "nogvltest.h"

VALUE rb_mNogvltest;

void
Init_nogvltest(void)
{
  rb_mNogvltest = rb_define_module("Nogvltest");
}
