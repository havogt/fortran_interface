#include "fortran_component/my_fortran_component.h"

int main(int argc, char **argv) {
  init_my_fortran_component(0);
  finalize_my_fortran_component();
}
