module Main exposing (..)

import Html exposing (..)
import Html exposing (beginnerProgram)
import Html.Events exposing (..)

type alias State =
    {
        secretVisible: Bool
    }

-- stan aplikacji
state: State
state =
    { secretVisible = False }

-- akcja
type Msg =
    ShowSecret | HideSecret -- ENUM

update : Msg -> State -> State
update msg state_ = -- zmienne w elmie nie moga zaczynac sie od _
    case msg of
        ShowSecret -> { state_ | secretVisible = True } -- tutejsza wersja {...state, xx = y }
        HideSecret -> { state_ | secretVisible = False }


view : State -> Html Msg -- musi byc taki jak typ updatu
view state_ =
    div
        []
        [
            h1 [] [text "Sekret"],
            button [ onClick ShowSecret ] [text "Pokaż"],
            button [ onClick HideSecret ] [text "Ukryj"],
            p
                []
                [
                    if state_.secretVisible then
                        text "To tejemnica CIIII "
                    else
                        text ""
                ]
        ]



main =
    beginnerProgram -- beginner program przyjmuje i wrapuje 3 argumenty
    {
        model = state,
        update = update,
        view = view
    }