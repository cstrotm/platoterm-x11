CFLAGS=-Os -DXLIB_ILLEGAL_ACCESS
X11_INCLUDE=/usr/openwin/include
X11_LIBS=/usr/X11/lib
X11_LIBS=/usr/openwin/lib
X11_LIBS=/usr/X11R6/lib
X11_INCLUDE=/usr/X11R6/include
OBJ=main.o touch.o io.o keyboard.o screen.o terminal.o protocol.o

all: platoterm

touch.o: touch.c
	cc -g $(CFLAGS) -I$(X11_INCLUDE) -o $@ -c touch.c

io.o: io.c
	cc -g $(CFLAGS) -o $@ -c io.c

keyboard.o: keyboard.c
	cc -g $(CFLAGS) -I$(X11_INCLUDE) -o $@ -c keyboard.c

screen.o: screen.c
	cc -g $(CFLAGS) -I$(X11_INCLUDE) -o $@ -c screen.c

terminal.o: terminal.c
	cc -g $(CFLAGS) -o $@ -c terminal.c

protocol.o: protocol.c
	cc -g $(CFLAGS) -o $@ -c protocol.c

main.o: main.c
	cc -g $(CFLAGS) -o $@ -c main.c

platoterm: $(OBJ)
	cc -g $(CFLAGS) -L$(X11_LIBS) -o $@ $(OBJ) -lX11 

clean:
	rm -rf platoterm $(OBJ)

run:
	./platoterm IRATA.ONLINE 8005
