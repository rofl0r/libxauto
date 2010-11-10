# @configure_input@

srcdir  = src
VPATH   = src
package = libxauto
version = 0.2.0


CC = cc
CFLAGS = -Wall
LIBFLAGS = -c
DBGFLAGS = -g


all: clean build link
test: clean build_test
#User should not be here, but I don't want this to fail
user_error:
	@echo "*** Running the default package in the parent directory ***"
	@echo
	@$(MAKE) -C ..

clean:
	rm -f *.o *.so
	rm -f $(package)_sendtext $(package)_findwindow

#Compile the source code - DO NOT COMPILE "main.c" - that is a separate test executable
build:
	$(CC) $(CFLAGS) $(LIBFLAGS) \
	$(srcdir)/xaut.c $(srcdir)/xaut_display.c $(srcdir)/xaut_keyboard.c \
	$(srcdir)/xaut_mouse.c $(srcdir)/xaut_window.c \
	-I/usr/include/X11/ \
	-DHAVE_CONFIG_H -DEN_US -DLESS_THAN_FIX

build_test:
	$(CC) $(CFLAGS) $(DBGFLAGS) \
	$(srcdir)/xaut.c $(srcdir)/xaut_display.c $(srcdir)/xaut_keyboard.c \
	$(srcdir)/xaut_mouse.c $(srcdir)/xaut_window.c $(srcdir)/main.c \
	-I/usr/include/X11/ \
	-lX11 -lXtst \
	-DHAVE_CONFIG_H -DEN_US -DLESS_THAN_FIX \
	-o $(package)_test

tools:
	$(CC) $(CFLAGS) $(DBGFLAGS) \
	$(srcdir)/xaut.c $(srcdir)/xaut_display.c $(srcdir)/xaut_keyboard.c \
	$(srcdir)/xaut_mouse.c $(srcdir)/xaut_window.c $(srcdir)/test_findwindow.c \
	-I/usr/include/X11/ \
	-lX11 -lXtst \
	-DHAVE_CONFIG_H -DEN_US -DLESS_THAN_FIX \
	-o $(package)_findwindow
	$(CC) $(CFLAGS) $(DBGFLAGS) \
	$(srcdir)/xaut.c $(srcdir)/xaut_display.c $(srcdir)/xaut_keyboard.c \
	$(srcdir)/xaut_mouse.c $(srcdir)/xaut_window.c $(srcdir)/test_sendtext.c \
	-I/usr/include/X11/ \
	-lX11 -lXtst \
	-DHAVE_CONFIG_H -DEN_US -DLESS_THAN_FIX \
	-o $(package)_sendtext

#Link the shared library
link:
	ld -shared xaut.o xaut_display.o \
	xaut_keyboard.o xaut_mouse.o xaut_window.o \
	/usr/lib/libX11.so /usr/lib/libXtst.so -o $(package).so

install:
	echo "install target currently incomplete. copy libxauto.so manually to you lib dir, i.e. /usr/lib"
	cp $(srcdir)/xaut.h /usr/include
	cp $(srcdir)/xaut_display.h /usr/include
	cp $(srcdir)/xaut_keyboard.h /usr/include
	cp $(srcdir)/xaut_mouse.h /usr/include
	cp $(srcdir)/xaut_window.h /usr/include
	cp $(srcdir)/xaut_types.h /usr/include
	
