#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  #Check for the element with the given argument
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE CAST(atomic_number AS TEXT) = '$1' OR symbol = '$1' OR name = '$1' ")
  if [[ -z $ATOMIC_NUMBER ]]
  then
    #Return element if not found
    echo "I could not find that element in the database."
  else
    #Get element details by joining elements, properties and types tables
    ELEMENT_DETAILS=$($PSQL "SELECT * FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER")
    echo "$ELEMENT_DETAILS" | while IFS="|" read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_WEIGHT MELTING_POINT BOILING_POINT TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_WEIGHT amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi