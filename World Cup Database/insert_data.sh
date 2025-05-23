#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.


cat games.csv | tail -n +2 | while IFS=',' read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Inserting Values to the teams table
  #Checking value if it exists or not
  CHECK_WINNER=$($PSQL "SELECT 1 FROM teams WHERE name = '$WINNER'")
  CHECK_OPPONENT=$($PSQL "SELECT 1 FROM teams WHERE name = '$OPPONENT'")

  #Inserting Values based on check
  if [[ -z $CHECK_WINNER ]]
  then
    echo "$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")"
  fi

  if [[ -z $CHECK_OPPONENT ]]
  then
    echo "$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")"
  fi

  #Inserting Values to the games Table
  #Getting Winner_id and Opponent_id from teams to insert them to games table
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  echo "$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")"

done