
CC = gcc

ifeq ($(windir),)
EXE =
RM = rm -vf
else
EXE = .exe
RM = del
endif

OBJECTS = mkbootfs.o
OUT = mkbootfs$(EXE)

all:$(OUT)

$(OUT):$(OBJECTS)
	$(CROSS_COMPILE)$(CC) -o $@ $^ -L. -static

.c.o:
	$(CROSS_COMPILE)$(CC) -o $@ -c $< -I.

clean:
	$(RM) $(OUT) $(OBJECTS) Makefile.~

