module Main exposing (..)

import Browser
import Html exposing (..)

import Story

type alias Model = 
    { story: Story.Story
    }

initialModel : Model
initialModel =
    { story = Story.init
    }    

type Msg
    = SetFlaw String
    | SetElements String String String

update : Msg -> Model -> Model
update msg model =
    case msg of 
        SetFlaw flaw -> {model | story = Story.setFlaw flaw}
        SetElements el1 el2 el3 -> {model | story = Story.setElements el1 el2 el3 model.story |> Maybe.withDefault model.story}


main : Program () Model Msg
main = 
    Browser.sandbox
    { init = initialModel
    , view = (\m -> text "Hello World")
    , update = update
    }