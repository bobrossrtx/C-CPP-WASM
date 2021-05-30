SRCDIR = src/
CPROGDIR = $(SRCDIR)cprog/
TEMPLATEDIR = $(SRCDIR)html_template/
OUTDIR = build/
CC = emcc

all: clean create.out

output.functions:
	$(CC) -o $(OUTDIR)functions.html $(CPROGDIR)functions.c -O3 -s WASM=1 --shell-file $(TEMPLATEDIR)shell_minimal.html -s NO_EXIT_RUNTIME=1 -s "EXPORTED_RUNTIME_METHODS=['ccall']"
	
output.helloWorld:
	$(CC) -o $(OUTDIR)helloWorld.html $(CPROGDIR)helloWorld.c -O3 -s WASM=1 --shell-file $(TEMPLATEDIR)shell_minimal.html

create.out:
	mkdir $(OUTDIR)

clean:
	rm -rf ./out