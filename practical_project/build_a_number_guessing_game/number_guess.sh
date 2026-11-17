#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read -r USERNAME

USER_RESULT=$($PSQL "SELECT user_id, username, games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -n "$USER_RESULT" ]]
then
  IFS="|" read -r USER_ID DB_USERNAME GAMES_PLAYED BEST_GAME <<< "$USER_RESULT"

  echo "Welcome back, $DB_USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000:"

while true
do
  read -r USER_GUESS || exit

  if [[ ! "$USER_GUESS" =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

  if [[ "$USER_GUESS" -gt "$SECRET_NUMBER" ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ "$USER_GUESS" -lt "$SECRET_NUMBER" ]]
  then
    echo "It's higher than that, guess again:"
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done

UPDATE_RESULT=$($PSQL "
  UPDATE users
  SET
    games_played = games_played + 1,
    best_game = CASE
      WHEN best_game IS NULL OR best_game > $NUMBER_OF_GUESSES
      THEN $NUMBER_OF_GUESSES
      ELSE best_game
    END
  WHERE user_id = $USER_ID
")