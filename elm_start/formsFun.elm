import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String exposing (..)
import Char exposing (..)

main =
  Html.beginnerProgram( {model = model, view = view, update = update} )

type alias Model =
  {
    name: String,
    pass: String,
    repeatedPass: String,
    age: String
  }

model : Model
model =
  Model "" "" "" "" -- takie uproszczenie dla wypelnienia domyslnych wartosci

type Msg =
    UpdateName String
  | UpdatePass String
  | UpdateRepeatedPass String
  | UpdateAge String

update : Msg -> Model -> Model
update msg model =
  case msg of
    UpdateName name -> { model | name = name}
    UpdatePass pass -> { model | pass = pass}
    UpdateRepeatedPass repeatedPass -> { model | repeatedPass = repeatedPass}
    UpdateAge age -> { model | age = age}

view: Model -> Html Msg
view model =
  div []
    [
      input [type_ "text", placeholder "Imie", onInput UpdateName] [],
      input [type_ "password", placeholder "Hasło", onInput UpdatePass] [],
      input [type_ "password", placeholder "Powtórz Hasło", onInput UpdateRepeatedPass] [],
      ageField model,
      validationView model
    ]

ageField: Model -> Html Msg -- posiadanie akcji wymaga uzycie Msg zamaist msg
ageField model=
  let color =
    validateNumber model.age
  in
    input [type_ "text", placeholder "Wiek", style [ ("color", color), ("border-color", color) ], onInput UpdateAge ] []

validationView: Model -> Html msg
validationView model =
  let
    (color, message) =
      if (length model.pass) < 3 then
        ("red", "Za krotkie")
      else if (not ( (String.any isDigit model.pass)
        && (String.any (\x -> isLower x) model.pass)
        && (String.any (\x -> isUpper x) model.pass) ) ) then
        ("red", "Wymaga dużych i małych liter oraz cyfr")
      else if not (model.pass == model.repeatedPass) then
        ("red", "Nie pasuje")
      else
        ("green", "Pasuje")
  in
    div [ style [("color", color)] ] [ text message ]

validateNumber: String -> String
validateNumber number =
  if ( String.all (\x -> Char.isDigit x) number ) then
   "green"
  else
    "red"