CC=gcc
BIN=xdh3c
OBJS=xd_h3c.o authenticate.o
CFLAGS=-lpcap -lgcrypt

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

%.o: %.c %.h
	$(CC) $(CFLAGS) -c $<

.PHONY: clean install uninstall

install:
	$(INSTALL) -d /usr/local/bin
	$(INSTALL) -p -D -m 0755 $(BIN) /usr/local/bin

uninstall:
	$(RM) /usr/local/bin/$(BIN)

clean:
	@$(RM) $(OBJS) $(BIN)

