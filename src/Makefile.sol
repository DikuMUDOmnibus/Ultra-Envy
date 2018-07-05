# Makefile for Solaris 2.4 for x86
# Changes contributed by Izuskin Kromosoeto and The Maniac

CC      = gcc
PROF    =
DEBUG   = -g
NOCRYPT =
O_FLAGS = -O2
C_FLAGS = $(O_FLAGS) -Wall -DSYSV $(DEBUG) $(PROF) $(NOCRYPT)
L_FLAGS =                         $(DEBUG) $(PROF) -lelf -lucb -lsocket -lnsl

O_FILES = act_comm.o act_info.o act_move.o act_obj.o act_wiz.o comm.o const.o \
          db.o fight.o handler.o interp.o magic.o save.o ssm.o update.o bit.o \
	  mem.o olc.o olc_act.o olc_save.o string.o mob_prog.o mob_comm.o     \
	  tables.o track.o wiznet.o gamble.o act_clan.o spec_mob.o spec_obj.o

envy: $(O_FILES)
	rm -f envy
	$(CC) $(L_FLAGS) -o envy $(O_FILES)

.c.o: merc.h
	$(CC) -c $(C_FLAGS) $<
