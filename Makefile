OBJS = accelerometer.o pod.o bms.o navigation.o
CC = g++
DEBUG = -g
CFLAGS = -std=c++11 -Wall -c -O3 $(DEBUG)
LFLAGS = -Wall $(DEBUG)
 


main : main.o pod.o accelerometer.o bms.o navigation.o
	$(CC) $(OBJS) $(LFLAGS) main.o -o main
 
main.o : main.cpp pod.h accelerometer.h bms.h navigation.h
	$(CC) $(CFLAGS) main.cpp

 
pod.o : pod.cpp pod.h accelerometer.h bms.h navigation.h
	$(CC) $(CFLAGS) pod.cpp

navigation.o : navigation.cpp navigation.h accelerometer.h
	$(CC) $(CFLAGS) navigation.cpp
 
accelerometer.o : accelerometer.cpp accelerometer.h
	$(CC) $(CFLAGS) accelerometer.cpp

bms.o : bms.cpp bms.h
	$(CC) $(CFLAGS) bms.cpp


clean :
	rm *.o main 

