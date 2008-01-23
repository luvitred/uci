COPTS=-g -O2
CFLAGS=$(COPTS) -fPIC -Wall -pedantic -std=gnu99 -Wno-unused -Werror $(if $(DEBUG),-DDEBUG_ALL)

AR=ar
CC=gcc
RANLIB=ranlib

all: uci

cli.o: cli.c uci.h
uci: cli.o libuci.a
	$(CC) $(CFLAGS) -o $@ $^

libuci.o: libuci.c file.c uci.h list.c err.h
libuci.a: libuci.o
	rm -f $@
	$(AR) rc $@ $^
	$(RANLIB) $@

clean:
	rm -f uci *.[oa]
