/* PLATOTERM for UNIX */

#include <stdio.h>
#include <stdlib.h>
#include "protocol.h"
#include "screen.h"
#include "io.h"
#include "terminal.h"
#include "keyboard.h"
#include "touch.h"

#define TRUE 1
#define FALSE 0

unsigned char already_started=FALSE;
unsigned char fill = TRUE;
int done = FALSE;
char hostname[64];
unsigned short port;

char* env_var;

main(argc, argv)
int argc;
char *argv[];
{
	if (argc<3)
	{
	  strlcpy(hostname,"irata.online",sizeof(hostname));
	  port=atoi("8005");
	}
	else
	{
	  strlcpy(hostname,argv[1],sizeof(hostname));
	  port=atoi(argv[2]);
	}

	env_var = getenv("PLATOTERM_DOFILL");
	if(env_var) {
	  if(env_var[0]=='N' || env_var[0]=='n')
	    fill=FALSE;
	}

	screen_init(hostname,port);
	touch_init();
	terminal_initial_position();
	io_init(hostname,port);

        while (done == FALSE)	
	{
		screen_main();
		io_main();
	}

	touch_done();
	io_done();
	screen_done();	
}
