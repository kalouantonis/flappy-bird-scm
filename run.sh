GREEN="\033[0;32m"
NO_COLOR="\033[0m"

# Print a message with a color and then reset the terminal color
# back to the default (no color)
function print_with_color {
    # Yep... bash if terrible
    echo $1$2$NO_COLOR
}

print_with_color $GREEN "Building..."
make all
print_with_color $GREEN "Running..."
build/flappy

