
LDFLAGS=-lm -ldl -Wl,-export-dynamic

s7: s7.c
	gcc -o $@ $^ -DWITH_MAIN ${LDFLAGS}

ffitest: s7.o ffitest.o
	gcc -o $@ $^ ${LDFLAGS}

clean:
	rm *.o

.PHONY: clean
