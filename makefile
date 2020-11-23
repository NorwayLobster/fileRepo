INC_DIR:= ../../include/utilities /usr/include/mysql/ 
SRC_DIR:= ./
SOURCES:=$(wildcard *.cc)
OBJECTS:=$(patsubst %.cc,%.o,$(SOURCES))
LIBS:= -lpthread -lcrypt -lmysqlclient 
#CXXFLAGS:=-g -Wall -fpic -std=c++11  -I ../../include/net -I /usr/include/mysql/ 
CXXFLAGS:=-g -Wall -fpic -std=c++11 $(addprefix -I, $(INC_DIR)) $(LIBS) -Wno-deprecated
ELF:=libutilities.so

$(ELF):$(OBJECTS)
	$(CXX) -shared $^ -o ../../lib/$@
clean:
	rm -rf $(OBJECTS) 
