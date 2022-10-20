#pragma once

#ifdef __cplusplus
extern "C" {
#else
#include "stdbool.h"
#endif

struct array1d {
  float *data;
  int size;
};

void init_my_fortran_component(bool);
void finalize_my_fortran_component();

#ifdef __cplusplus
}
#endif
