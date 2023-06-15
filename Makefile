CC=g++ #-std=c++17
SRCDIR=src
OBJDIR=obj
BINDIR=bin
DEPDIR=includes
SRCS=$(wildcard $(SRCDIR)/*.cpp)
OBJS=$(SRCS:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
DEP=$(wildcard $(DEPDIR)/*.hpp)
INC=-I$(DEPDIR)
FLAGS=-lm -O2 # -ggdb3 -pg

all: bin/main

bin/main: $(OBJS) $(DEP)
	@echo "Linking objects into main.exe..."
	@$(CC) $(INC) $(FLAGS) -o $(BINDIR)/main $(OBJS) 

obj/%.o : src/%.cpp $(DEP)
	@echo "Creating $(<:src/%.cpp=%) object file..."
	@$(CC) $(INC) $(FLAGS) -c -o $@ $< 

.PHONY:clean 

clean:
	@rm -rf ./obj/*.o ./bin/*.exe .bin/*.out bin/main

.PHONY:run 

run : bin/main.out
	@echo "Executing binary..."
	@./bin/main.out	




	
