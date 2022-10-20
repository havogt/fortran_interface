module my_fortran_component

  use, intrinsic :: iso_c_binding
  implicit none
  
!   private
  
  real(c_float), allocatable :: tmp_a(:), tmp_b(:)
  logical(c_bool) :: glob_mode

contains

  subroutine init_my_fortran_component(mode) bind(c)
    logical(kind=c_bool), value :: mode
    glob_mode = mode
    allocate(tmp_a(42))
    if (mode) then
      allocate(tmp_b(42))
    end if
  end subroutine init_my_fortran_component

  subroutine finalize_my_fortran_component() bind(c)
    if (allocated(tmp_b)) then
      deallocate(tmp_b)
    end if
  end subroutine finalize_my_fortran_component

  subroutine run_my_fortran_component(a, b)
    real(c_float) :: a(:)
    real(c_float), optional :: b(:)

    if (glob_mode) then 
        if (.not. present(b)) then
            call exit(1)
        end if
        tmp_b(:) = b(:)
    end if
    a = tmp_a
  end subroutine run_my_fortran_component

  ! c interface
!   subroutine 

!   subroutine foo_centry(a) bind(c,name='foo')
!     type(c_ptr), value :: a
!     real(c_float), pointer :: a_pass

!     nullify(a_pass)
!     if (c_associated(a)) call c_f_pointer(a, a_pass)
!     call foo(a_pass)
!   end subroutine foo_centry

!   subroutine foo(a)
!     real(c_float), optional :: a
!   end subroutine foo

end module my_fortran_component
