module Story exposing (..)

import Downfall exposing (..)
import Set exposing (Set)


type Story
    = EmptyStory
    | WithFlaw { flaw : String }
    | WithElements String String String String
    | CompleteStory
        { flaw : String
        , elements : Set String
        , description : String
        , traditions : List Tradition
        , hero : Hero
        , fallen : NonHero
        , pillar : NonHero
        , rounds : List Round
        , collapse :
            List
                { vignette : String
                , heroDies : Bool
                }
        }


init : Story
init =
    EmptyStory


setFlaw : String -> Story
setFlaw flaw =
    WithFlaw { flaw = String.toLower flaw }


getFlaw : Story -> Maybe String
getFlaw story =
    case story of
        EmptyStory ->
            Nothing

        WithFlaw a -> Just a.flaw

        WithElements flaw _ _ _ ->
            Just flaw

        CompleteStory s ->
            Just s.flaw


setElements : String -> String -> String -> Story -> Maybe Story
setElements el1 el2 el3 story =
    case story of
        WithFlaw {flaw} ->
            Just (WithElements flaw (String.toLower el1) (String.toLower el2) (String.toLower el3))

        _ ->
            Nothing


getElements : Story -> Maybe (List String)
getElements story =
    case story of
        WithElements _ el1 el2 el3 -> Just [el1, el2, el3]
        _ -> Nothing
            