TARGET=tarea1
all: ${TARGET}
 
${TARGET}: ${TARGET}_lexer.o main.o
	g++ --std=c++11 -g -o $@ $^
 
main.o: main.cpp
	g++ --std=c++11 -g -c -o $@ $<
 
${TARGET}_lexer.o: ${TARGET}_lexer.cpp
	g++ --std=c++11 -g -c -o $@ $<
 
${TARGET}_lexer.cpp: ${TARGET}.l
	flex -o $@ $<
 

 
clean:
	rm -f *.o
	rm -f ${TARGET}_lexer.cpp
	rm -f ${TARGET}
	rm -f ${TARGET}_parser.cpp
	rm -f tokens.h
