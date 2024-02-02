#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

"$($PSQL "TRUNCATE TABLE games, teams")"

echo -e "\n~~ Añadiendo las selecciones ~~\n"

cat games.csv | while IFS="," read N1 N2 WINNER OPPONENT N3 N4
do
  # Verificar que no sea el nombre de la columna
  if [[ $WINNER != "winner" && $OPPONENT != "opponent" ]]
  then
    # Obtener el país con la variable WINNER
    WINNER_CASE=$($PSQL "SELECT * FROM teams WHERE name='$WINNER'")
    # Obtener el país con la variable OPPONENT
    OPPONENT_CASE=$($PSQL "SELECT * FROM teams WHERE name='$OPPONENT'")

    # Verificar si WINNER_CASE está vacío
    if [[ -z $WINNER_CASE ]]
    then
      # Añadir la selección
      WINNER_INSERT="$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")"
      if [[ $WINNER_INSERT == "INSERT 0 1" ]]
      then
        echo "'$WINNER' añadido a la tabla 'teams'"
      fi
    fi

    # Verificar si OPPONENT_CASE está vacío
    if [[ -z $OPPONENT_CASE ]]
    then
      # Añadir la selección
      OPPONENT_INSERT="$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")"
      if [[ $OPPONENT_INSERT == "INSERT 0 1" ]]
      then
        echo "'$OPPONENT' añadido a la tabla 'teams'"
      fi
    fi
  fi
done

echo -e "\n~~ Añadiendo las partidas ~~\n"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Verificar que no sea el nombre de la columna
  if [[ $YEAR != "year" ]]
  then
    # Obtener los ID del ganador y del perdedor
    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
    OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
    
    # Añadir la partida
    GAME_INSERT="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"
    if [[ $GAME_INSERT == "INSERT 0 1" ]]
    then
      echo "Partida entre $WINNER y $OPPONENT añadida"
    fi
  fi
done
