CC = cc

# includes and flags
FREETYPEINC = /usr/include/freetype2
LIBS =  -lXft -lX11 -lXcursor -lXft -I${FREETYPEINC}
CFLAGS = -O3 -ffast-math -Wall -Wextra

SRC = ragnar.c
OBJ = ${SRC:.c=.o}

all: ragnar print_options 

print_options:
	@echo ragnar build options:
	@echo "CFLAGS = ${CFLAGS}"
	@echo "LIBS   = ${LIBS}"
	@echo "CC     = ${CC}"

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h

ragnar: ${OBJ}
	${CC} -o $@ ${OBJ} ${LIBS}

install:
	cp -f ragnar /usr/bin
	cp -f ragnar.desktop /usr/share/applications
	chmod 755 /usr/bin/ragnar

clean:
	rm -f ragnar ${OBJ}

uninstall:
	rm -f /usr/bin/ragnar
	rm -f /usr/share/applications/ragnar.desktop

freetype:
	mv /usr/include/freetype/*  /usr/include/

.PHONY: all print_options clean install uninstall freetype
