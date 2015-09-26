
CC = gcc

ifeq ($(windir),)
EXE =
RM = rm -f
else
EXE = .exe
RM = del
endif

CFLAGS = -ffunction-sections -O3 -Wno-unused-result
LDFLAGS = -Wl,--gc-sections
OBJECTS = mkbootfs.o
OUT = mkbootfs$(EXE)

all:$(OUT)

$(OUT):$(OBJECTS)
	$(CROSS_COMPILE)$(CC) -o $@ $^ -L. $(LDFLAGS) -static -s

.c.o:
	$(CROSS_COMPILE)$(CC) -o $@ $(CFLAGS) -c $< -I. -Werror

clean:
	$(RM) $(OUT) $(OBJECTS) Makefile.~

