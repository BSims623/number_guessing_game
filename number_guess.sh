#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\n~~~~ Welcome to The Number Guessing Game! ~~~~\n"

SECRET_NUMBER=$((RANDOM % 1000 + 1))

COUNT=0

MAIN_MENU() {
  if [[ $1 ]]
  then 
    echo -e "\n$1\n"
  fi  
  echo Enter your username:
  read USERNAME
  if [[ ! $USERNAME =~ ^.{1,22}$ ]]
  then 
    MAIN_MENU "Enter a username that is 22 characters or less"
  else 
    GET_USERNAME_INFO "$USERNAME"  
  fi  
}

GET_USERNAME_INFO() {
    echo "$1"
}

MAIN_MENU