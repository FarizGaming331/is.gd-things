#!/bin/bash
echo "WASD to move. M to mine dots and q to exit."
sleep 3
# Initialize player position and game map
player_x=0
player_y=0
game_map=("...." "...." "...." "....")

while true; do
    clear

    # Print the game map
    for row in "${game_map[@]}"; do
        echo "$row"
    done

    # Print player position
    echo "Player: X=$player_x Y=$player_y"

    # Read user input
    read -rsn1 input
    case "$input" in
        "w")
            if ((player_y > 0)); then
                ((player_y--))
            fi
            ;;
        "s")
            if ((player_y < 3)); then
                ((player_y++))
            fi
            ;;
        "a")
            if ((player_x > 0)); then
                ((player_x--))
            fi
            ;;
        "d")
            if ((player_x < 3)); then
                ((player_x++))
            fi
            ;;
        "m")
            # Mine block
            game_map[$player_y]=${game_map[$player_y]:0:$player_x}.${
game_map[$player_y]:$((player_x + 1))}
            ;;
        "q")
            clear
            echo "Thanks for playing!"
            exit
            ;;
    esac
done
