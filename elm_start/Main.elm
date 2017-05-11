module Main exposing (..)
--elm package install elm-lang/html -- by dzialalo Html

import Html exposing (h1, text, div)
import String exposing (toUpper, length)



-- to funkcja ask przyjmujaca name
ask : String -> String -> String
ask name extension=
    "Jak się masz "
        ++ name
        ++ " "
        ++ extension
        ++ "?"

askUpper : String -> String
askUpper = toUpper << ask "Rafał" -- partial apliance

main =
--    text "test"

    -- <| pipe operator - to co na prawo bedzie wykonane i przekazane na lewo  - monadycznie
      text <| ask "Rafał" <| toUpper "co u ciebie?" -- wynik funkcji do funkcji


--      text <| askUpper "Hehe"
