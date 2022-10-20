program main
    use iso_c_binding
    use my_fortran_component

    implicit none
    
    logical(c_bool) :: mode
    real(c_float) :: a(42), b(42)

    mode = .TRUE.
    ! mode = .false.
    call init_my_fortran_component(mode)
    call run_my_fortran_component(a=a, b=b)
    ! call run_my_fortran_component(a=a)
    call finalize_my_fortran_component()

    print *, "It works!"
end program main
