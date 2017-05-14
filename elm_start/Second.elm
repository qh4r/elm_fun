module Second exposing (..)

import Html exposing (text)

-- mozna otypowac
type alias Animal =
  {
    species: String,
    count: Int
  }

-- hash set

animal : Animal
animal =
  {
    species = "cat",
    count = 5
  }

renderAnimal : Animal -> String
renderAnimal animal = "Species: " ++ animal.species ++ ", count: " ++ toString (.count animal)

-- <| rozpakowywuje string do msg
main =
  text <| "TEST " ++ (.species animal)++ ", " ++ (toString animal.count) ++ renderAnimal animal -- .metoda obiekt jest wymienne z obiekt.metoda


--  text ("TEST " ++ (.species animal)++ ", " ++ (toString animal.count)) -- tak tez zadziala
