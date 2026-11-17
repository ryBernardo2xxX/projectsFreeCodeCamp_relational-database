
#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z "$1" ]]
then
  echo "Please provide an element as an argument."
  exit 0
fi

if [[ "$1" =~ ^[0-9]+$ ]]
then
  WHERE_CLAUSE="atomic_number = $1"
else
  WHERE_CLAUSE="symbol = '$1' OR name = '$1'"
fi

ELEMENT=$($PSQL "
  SELECT
    atomic_number,
    symbol,
    name,
    type,
    atomic_mass,
    melting_point_celsius,
    boiling_point_celsius
  FROM elements
  INNER JOIN properties USING(atomic_number)
  INNER JOIN types USING(type_id)
  WHERE $WHERE_CLAUSE
")

if [[ -z "$ELEMENT" ]]
then
  echo "I could not find that element in the database."
  exit 0
fi

IFS="|" read -r ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< "$ELEMENT"

echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."