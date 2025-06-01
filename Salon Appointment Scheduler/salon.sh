#!/bin/bash

echo -e "\n~~~ My Salon ~~~\n"
echo -e "Welcome to my Salon, how can I help you?\n"


PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"


ASK_DETAILS()
{
  SERVICE_ID_SELECTED=$1
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  SERVICE_NAME=$(echo $SERVICE_NAME | sed 's/^ *//g')

  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE' ")
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e  "\nI do not have record for that phone number. What is your name?"
    #Read name and insert the data to the customers table
    read CUSTOMER_NAME
    $PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')"
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    echo -e"\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME"
    read SERVICE_TIME
    $PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')"
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
    CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed 's/^ *//g')
    echo -e"\nWhat time would you like your$SERVICE_NAME, $CUSTOMER_NAME"
    read SERVICE_TIME
    $PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')"
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

SERVICE_MENU()
{ 

  if [[ $1 ]]
  then
    echo -e "$1"
  fi


  echo -e "1) cut\n2) color\n3) perm\n4) style\n5) trim"
  
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
  1|2|3|4|5) ASK_DETAILS $SERVICE_ID_SELECTED ;;
  *) SERVICE_MENU "I could not find that service, What would you like today?" ;;
  esac


}

SERVICE_MENU

