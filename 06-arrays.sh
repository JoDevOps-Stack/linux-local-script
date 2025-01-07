#!bin/bash

MOVIES=("KICK""RRR""DEVARA")
#index starts 0, size 3

echo "first movie: ${MOVIES[0]}"
echo "Second movie: ${MOVIES[1]}"
echo "third movie: ${MOVIES[2]}"

echo "all movies are: ${MOVIES(@)}"