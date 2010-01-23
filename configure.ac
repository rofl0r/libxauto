#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.64])
AC_INIT([xaut], [0.2.0], [chrsprkr3@gmail.com])
AC_CONFIG_SRCDIR([config.h.in])
AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CC
AC_PROG_INSTALL

# Checks for libraries.
AC_CHECK_LIB([X11], [XOpenDisplay], [], [AC_MSG_ERROR([X11 development libraries not found.  Exiting.])])
AC_CHECK_LIB([Xtst], [XTestFakeButtonEvent], [], [AC_MSG_ERROR([X11 test libraries not found.  Exiting.])])

#Selects the current python version - the pattern should be obvious
AC_CHECK_LIB([python2.5], [Py_Main], [LOCAL_PYTHON_VERSION="2.5"])
AC_CHECK_LIB([python2.6], [Py_Main], [LOCAL_PYTHON_VERSION="2.6"])

if test "x$LOCAL_PYTHON_VERSION" = "x"; then
    echo Python library not found.  Exiting.
    exit -1
else
    echo Using python$LOCAL_PYTHON_VERSION
    AC_SUBST(LOCAL_PYTHON_VERSION)
fi

AC_CHECK_PROG([swig_prog], [swig], [swig], [])
if test "x$swig_prog" = "x"; then
    echo swig not found.  Exiting.
    exit -1
fi

# Checks for header files.
AC_PATH_X
AC_CHECK_HEADERS([float.h limits.h stdlib.h string.h unistd.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_TYPE_SIZE_T

# Checks for library functions.
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_CHECK_FUNCS([floor memset regcomp strstr])

AC_CONFIG_FILES([Makefile
                 src/Makefile])
AC_OUTPUT
