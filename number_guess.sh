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
  GET_USERNAME=$($PSQL "SELECT * FROM usernames WHERE username='$USERNAME'")
  if [[ -z $GET_USERNAME ]]
  then 
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    INSERT_NEW_USERNAME=$($PSQL "INSERT INTO usernames(username,games_played) VALUES('$USERNAME',0)")
    GET_USERNAME=$($PSQL "SELECT * FROM usernames WHERE username='$USERNAME'")
    GUESS_NUMBER 
  else 
    echo "$GET_USERNAME" | while IFS="|" read USERNAME GAMES_PLAYED BEST_GAME
    do
      echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
    GUESS_NUMBER 
  fi
}

GUESS_NUMBER() {
echo -e "\nGuess the secret number between 1 and 1000:" 
read GUESS
FILTER_GUESS "$GUESS"
}

FILTER_GUESS() {
    echo "$1"
}

MAIN_MENU