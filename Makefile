# The compiler 
CC=csc
# The REPL command
REPL=csi

# The source files
SOURCES=main.scm

# The output directory for executables and intermediate files
OUTDIR=build
# The file name of the final executable
OUTBIN=flappy

# Default build task
all: compile

run: 
	${OUTDIR}/${OUTBIN}

# Run the program in the REPL
repl:
	${REPL} ${SOURCES}

# Compile the executable
compile: mk_out_dir
	${CC} ${SOURCES} -o ${OUTDIR}/${OUTBIN}

# Create the output directory 
mk_out_dir: 
	-mkdir ${OUTDIR}

