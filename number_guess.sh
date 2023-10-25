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
if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
  echo -e "\nThat is not an integer, guess again:" 
  read GUESS 
  FILTER_GUESS "$GUESS"
fi  
if [[ $GUESS -lt $SECRET_NUMBER ]]
then
  ((COUNT = COUNT + 1))
  echo -e "\nIt's higher than that, guess again:"
  read GUESS
  FILTER_GUESS "$GUESS"
fi  
if [[ $GUESS -gt $SECRET_NUMBER ]]
then
  ((COUNT = COUNT + 1))
  echo -e "\nIt's lower than that, guess again:"
  read GUESS
  FILTER_GUESS "$GUESS"
fi
}

INSERT_DATA() {
  ((COUNT = COUNT + 1))
  echo "$GET_USERNAME" | while IFS="|" read USERNAME GAMES_PLAYED BEST_GAME
  do
  ((GAMES_PLAYED = GAMES_PLAYED + 1))
  if [[ -z $BEST_GAME || $COUNT -lt $BEST_GAME ]]
  then 
  BEST_GAME="$COUNT"
  fi
  INSERT_GAME_RESULTS=$($PSQL "UPDATE usernames SET games_played = $GAMES_PLAYED, best_game = $BEST_GAME WHERE username='$USERNAME'")
  done
  echo -e "\nYou guessed it in $COUNT tries. The secret number was $SECRET_NUMBER. Nice job!\n"
}

MAIN_MENU
INSERT_DATA
