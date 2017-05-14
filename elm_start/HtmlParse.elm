module HtmlParse exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..) -- dostep do atrybutow (style id itd)

type alias Car =
  {
    model: String,
    age: Int,
    owner: String
  }

cars : List Car
cars =
  [
    {
      model = "Audi",
      age = 15,
      owner = "Rafał"
    },
    {
      model = "Ford",
      age = 6,
      owner = "Krzysztof"
    },
    {
      model = "Opel",
      age = 17,
      owner = "Janusz"
    }
  ]

 --- html to typ szablonowy i wymaga podania dodatkowego argumentu po nim -- nazwa obojetna
renderCar : Car -> Html msg
renderCar car =
  li
    [style [("color", "red"), ("list-style", "none")]]
    [
      b [] [text car.model],
      text <| " owned by: " ++ car.owner ++ " is ",
      i [] [text <| toString <| car.age],
      text " years old"]


-- mała literka okresla dla elma typ generyczny
genericLi : a -> Html msg
genericLi input =
  li [] [text <| toString <| input]

nums : List Int
nums = [1,2,34,5]

objs = [{name= "test"}, {name = "rekin"}, {name = "wunsz"}]

--div : List (Attribute msg) -> List (Html msg) -> Html msg
renderCars : Html msg
renderCars =
  div
    [
      style [
              ("font-family", "Arial sans-serif"),
              ("padding", "1.5rem")
            ]
    ]
    [
      h1 [] [text "CARS"],
      p [] [text "tes-t"],
      ul
        []
        <| List.map (\car -> renderCar car) cars -- bez <| rpobowal by przekazac auta jako osobne parametry
      , ul [style [("color", "blue")]] <| List.map genericLi nums
      , ul [style [("color", "green")]] <| List.map genericLi objs
    ]

main =
  renderCars