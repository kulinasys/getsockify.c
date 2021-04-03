TARGETS=webserv
CFLAGS += -fPIC

all: $(TARGETS)

webserv	: websockify.so main.o http.o
	$(CC) $(LDFLAGS) main.o websockify.o websocket.o http.o -lssl \
		-lcrypto -o webserv

websocket.o: websocket.c websocket.h
websockify.o: websockify.c websocket.h
websockify.so	: websocket.o websockify.o http.o
		  $(CC) -shared $(CFLAGS) -o websockify.so websocket.o \
		  websockify.o http.o

clean:
	rm -f webserv *.o *.so

