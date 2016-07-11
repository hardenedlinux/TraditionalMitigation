TARGET	= partial full

all : $(TARGET)

partial: testcase.c
	gcc -g -o $@ $<

full: testcase.c
	gcc -g -Wl,-z,relro,-z,now -o $@ $<

clean:
	rm -f $(TARGET)
