CFLAGS=-D_FILE_OFFSET_BITS=64

linux64:	plot plotavx2 

linux32:	plot32 

all:		linux64 linux32

dist:		linux64 linux32 win64
		rm -f bin/* shabal64.o shabal32.o dcct_miner.tgz
		mv plot plotavx2 bin
		tar -czf omdcct_plotter.tgz *

plot:		plot.c shabal64.o helper64.o mshabal_sse4.o 
		gcc -Wall -m64 -O2 -o plot plot.c shabal64.o helper64.o mshabal_sse4.o -march=native -lpthread -std=gnu99

plotavx2:	plot.c shabal64.o helper64.o mshabal_sse4.o mshabal256_avx2.o 
		gcc -Wall -m64 -O2 -o plotavx2 plot.c shabal64.o helper64.o mshabal_sse4.o mshabal256_avx2.o -march=native -lpthread -std=gnu99 -DAVX2

plot32:		plot.c shabal32.o helper32.o mshabal_sse432.o
		gcc -Wall -m32 -O2 -o plot32 plot.c shabal32.o helper32.o mshabal_sse432.o -lpthread

helper64.o:	helper.c
		gcc -Wall -m64 -c -O2 -o helper64.o helper.c		

helper32.o:	helper.c
		gcc -Wall -m32 -c -O2 -o helper32.o helper.c		

shabal64.o:	shabal64.s
		gcc -Wall -m64 -c -O2 -o shabal64.o shabal64.s

shabal32.o:	shabal32.s
		gcc -Wall -m32 -c -o shabal32.o shabal32.s

mshabal_sse4.o: mshabal_sse4.c
		gcc -Wall -m64 -c -O2 -march=native -o mshabal_sse4.o mshabal_sse4.c

mshabal256_avx2.o: mshabal256_avx2.c
		gcc -Wall -m64 -c -O2 -march=native -mavx2 -o mshabal256_avx2.o mshabal256_avx2.c

mshabal_sse432.o: mshabal_sse4.c
		gcc -Wall -m32 -c -O2 -march=native -o mshabal_sse432.o mshabal_sse4.c

clean:
		rm -f mshabal_sse432.o mshabal_sse4.o mshabal256_avx2.o shabal64.o shabal32.o helper64.o helper32.o plot plotavx2 plot32 helper32.o helper64.o omdcct_plotter.tgz

