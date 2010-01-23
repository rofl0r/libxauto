#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.
# $URL$
# $Author$
# $Date$
# $Rev$


AC_PREREQ(2.61)
AC_INIT([xaut], [0.1.1], [chrsprkr3@gmail.com])
AC_CONFIG_SRCDIR([src/main.c])
AC_CONFIG_HEADER([config.h])

# Checks for programs.
AC_PROG_CC
AC_PROG_INSTALL

# Checks for libraries.
# FIXME: Replace `main' with a function in `-lX11':
AC_CHECK_LIB([X11], [main])
# FIXME: Replace `main' with a function in `-lXtst':
AC_CHECK_LIB([Xtst], [main])

# Checks for header files.
AC_PATH_X
AC_HEADER_STDC
AC_CHECK_HEADERS([float.h limits.h stdlib.h string.h unistd.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_C_CONST
AC_TYPE_SIZE_T

# Checks for library functions.
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_CHECK_FUNCS([floor memset regcomp strstr])

AC_CONFIG_FILES([Makefile
                 src/Makefile])
AC_OUTPUT
