GREEN="\033[0;32m"
NO_COLOR="\033[0m"

# Print a message with a color and then reset the terminal color
# back to the default (no color)
function print_with_color {
    # Yep... bash if terrible
    echo $1$2$NO_COLOR
}

function run_in_repl {
    csi main.scm
}

function build_and_run {
    print_with_color $GREEN "Building..."
    make all
    print_with_color $GREEN "Running..."
    build/flappy
}

function help_and_quit {
    echo "Usage: run [OPTIONS]"
    echo "\t-r ==> Run in REPL"
    exit 0
}

function error {
    echo $1
    exit 1
}


options=":r:h"
while getopts $options option
do
    case $option in 
    r  ) run_in_repl;;
    h  ) help_and_quit;;
    \? ) error "Unrecognised option: -$OPTARG" >& 2;;
    esac
done

if [ $OPTIND -eq 1 ]; then 
    # Default action if no parameters were passed
    build_and_run
fi

shift $((OPTIND-1))
