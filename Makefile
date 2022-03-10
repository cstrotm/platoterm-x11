CFLAGS=-g -w -O2 #-DXLIB_ILLEGAL_ACCESS
LDFLAGS=
EXTRALIBS=
STRIP?=strip

ThisOS != sh -c 'uname -s 2>/dev/null || echo not'

# SunOS (Solaris)
SunOS_X11_INCLUDE=/usr/openwin/include
SunOS_X11_LIBS=/usr/openwin/lib

# Linux
Linux_X11_LIBS=/usr/X11/lib
Linux_X11_INCLUDE=/usr/X11R6/include
Linux_EXTRALIBS=-lbsd

# OpenBSD
OpenBSD_X11_LIBS=/usr/X11R6/lib
OpenBSD_X11_INCLUDE=/usr/X11R6/include

# FreeBSD
FreeBSD_X11_LIBS=/usr/local/lib
FreeBSD_X11_INCLUDE=/usr/local/include

OBJ=main.o touch.o io.o keyboard.o screen.o terminal.o protocol.o

all: platoterm

touch.o: touch.c
	$(CC)  $(CFLAGS) -I$($(ThisOS)_X11_INCLUDE) -o $@ -c touch.c

io.o: io.c
	$(CC)  $(CFLAGS) -o $@ -c io.c

keyboard.o: keyboard.c
	$(CC)  $(CFLAGS) -I$($(ThisOS)_X11_INCLUDE) -o $@ -c keyboard.c

screen.o: screen.c
	$(CC)  $(CFLAGS) -I$($(ThisOS)_X11_INCLUDE) -o $@ -c screen.c

terminal.o: terminal.c
	$(CC)  $(CFLAGS) -o $@ -c terminal.c

protocol.o: protocol.c
	$(CC)  $(CFLAGS) -o $@ -c protocol.c

main.o: main.c
	$(CC)  $(CFLAGS) -I$($(ThisOS)_X11_INCLUDE) -o $@ -c main.c

platoterm: $(OBJ)
	$(CC)  $(CFLAGS) $(LDFLAGS) -L$($(ThisOS)_X11_LIBS) -o $@ $(OBJ) -lX11 $($(ThisOS)_EXTRALIBS) 

clean:
	rm -rf platoterm $(OBJ)

run:
	./platoterm IRATA.ONLINE 8005
