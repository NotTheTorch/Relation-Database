#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
SECRET_NUMBER=$(( RANDOM%1000+1 ))
NUMBER_OF_GUESSES=0
BEST_GAME_GLOBAL=""
GAMES_PLAYED_GLOBAL=0

echo "$SECRET_NUMBER"


GUESS_GAME()
{
  USERNAME=$1
  read GUESS_NUMBER

  #Check if guess number is valid
  if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    GUESS_GAME "$USERNAME"

  #if the guess number is valid
  else
    if [[ $GUESS_NUMBER == $SECRET_NUMBER ]]
    then
      ((NUMBER_OF_GUESSES+=1))
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was ${SECRET_NUMBER}. Nice job!"
      if [[ -z $BEST_GAME_GLOBAL ]] || (( NUMBER_OF_GUESSES < BEST_GAME_GLOBAL ))
      then
        BEST_GAME_GLOBAL=$NUMBER_OF_GUESSES
      fi
      $PSQL "UPDATE users SET best_game = $BEST_GAME_GLOBAL WHERE username = '$USERNAME' " > /dev/null
    
    elif [[ $GUESS_NUMBER -gt $SECRET_NUMBER ]]
    then
      ((NUMBER_OF_GUESSES+=1))
      echo "It's higher than that, guess again:"
      GUESS_GAME "$USERNAME"

    else
      ((NUMBER_OF_GUESSES+=1))
      echo "It's lower than that, guess again:"
      GUESS_GAME "$USERNAME"

    fi

  fi

}

CHECK_USER()
{
  USER_NAME=$1
  #Get details of the user
  USER_DETAILS=$($PSQL "SELECT * FROM users WHERE username = '$USER_NAME'")
  #If user does not exist in the table
  if [[ -z $USER_DETAILS ]]
  then
    echo "Welcome, $USER_NAME! It looks like this is your first time here."
    GAMES_PLAYED_GLOBAL=1
    $PSQL "INSERT INTO users(username,games_played) VALUES('$USER_NAME',$GAMES_PLAYED_GLOBAL)" > /dev/null

  else
    while IFS="|" read USERNAME GAMES_PLAYED BEST_GAME
    do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    GAMES_PLAYED_GLOBAL=$(( GAMES_PLAYED + 1 ))
    $PSQL "UPDATE users SET games_played = $GAMES_PLAYED_GLOBAL WHERE username = '$USER_NAME' " > /dev/null
    BEST_GAME_GLOBAL=$BEST_GAME
    done < <(echo "$USER_DETAILS")
  fi
  echo "Guess the secret number between 1 and 1000:"
  GUESS_GAME "$USER_NAME"
}

GET_USERNAME()
{
  echo "Enter your username:"
  read USER_NAME

  if [[ -z $USER_NAME ]]
  then
    GET_USERNAME
  else
    CHECK_USER "$USER_NAME"
  fi

}

GET_USERNAME