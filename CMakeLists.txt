cmake_minimum_required(VERSION 3.16.2)

project(sample LANGUAGES CXX C Fortran)

add_subdirectory(fortran_component)

add_executable(fmain main.f90)
target_link_libraries(fmain my_fortran_component)
target_include_directories(fmain PRIVATE "fortran_component")

add_executable(cmain main.c)
target_link_libraries(cmain my_fortran_component)
