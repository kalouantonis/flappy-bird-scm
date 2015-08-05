# The compiler 
CC=csc

# The source files
SOURCES=main.scm

# The output directory for executables and intermediate files
OUTDIR=build
# The file name of the final executable
OUTBIN=flappy

# Default build task
all: compile

# Compile the executable
compile: mk_out_dir
	${CC} ${SOURCES} -o ${OUTDIR}/${OUTBIN}

# Create the output directory 
mk_out_dir: 
	-mkdir ${OUTDIR}

