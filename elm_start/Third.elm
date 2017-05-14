module Second exposing (..)

import Html exposing (text)
import String exposing (toUpper)

type alias Animal =
  {
    species: String,
    count: Int
  }

animals : List Animal
animals =
  [
     {
        species = "cat",
        count = 5
      },
      {
        species = "dog",
        count = 43
      },
      {
        species = "lion",
        count = 3
      },
      {
        species = "monkey",
        count = 12
      }
  ]

-- LISTY MUSZA MIEC 1 SPOJNY TYP


findAnimal : List Animal -> String -> Maybe Animal
findAnimal animals key =
  List.foldl
    (\animal output ->  case output of
      Just _ -> output
      Nothing -> if animal.species == key
        then Just animal
        else Nothing) Nothing animals

readAnimal : Maybe Animal -> String
readAnimal maybeAnimal = case maybeAnimal of
  Just animal ->  .species animal
  Nothing -> ""

sumStrings : String -> String -> String
sumStrings next sum =
    sum ++ ", _>" ++ next
    -- fold przyjmuje odwrotnie parametry (niz reduce)
main =
  text <| (toUpper <| toString <| List.foldl sumStrings "start " <| List.map .species <| animals) ++ " FIND RESULT -> : "
    ++ ( readAnimal <| findAnimal animals "lion")
  -- poczatkowy parametr jest koneiczny w foldach