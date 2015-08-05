# Flappy bird (Scheme)

A trivial port of flappy bird to scheme. It's just done as a learning excersise
and an experiment in game development with lisps in general as viable tools
for 2D game development.

## Requirements
1. [Chicken Scheme](http://www.call-cc.org/)
2. [Chicken SDL2](https://gitlab.com/jcroisant/chicken-sdl2)

## Compiling and Running
If you want to compile and run then use `make all`. This will build an executable 
in build/flappy, which you can then invoke with `build/flappy`.  

Otherwise, if you want to run the program inside a REPL, use `make repl`. Note,
that to actually execute the game, you must evaluate `(run-game)` inside of the REPL.


