OPTIONS = -O2

all: main KDTree
	g++ -o main.exe *.o

main: main.cpp
	g++ -c main.cpp $(OTIONS)

KDTree: KDTree.cpp
	g++ -c KDTree.cpp $(OPTIONS)

clean:
	rm *.o
	rm *.exe
